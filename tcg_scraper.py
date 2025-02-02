import os
from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
from airtable import Airtable

# Configuration (move these to a separate config file or use environment variables)
AIRTABLE_PAT = os.environ.get("AIRTABLE_PAT")
AIRTABLE_BASE_ID = os.environ.get("AIRTABLE_BASE_ID")
AIRTABLE_TABLE_NAME = os.environ.get("AIRTABLE_TABLE_NAME")
SCRAPE_URL = "https://www.tcgplayer.com/categories/trading-and-collectible-card-games/one-piece-card-game/price-guides/emperors-in-the-new-world"  # More descriptive name

if not all([AIRTABLE_PAT, AIRTABLE_BASE_ID, AIRTABLE_TABLE_NAME]):
    raise ValueError(
        "Airtable credentials (PAT, Base ID, Table Name) must be set as environment variables.")

airtable = Airtable(AIRTABLE_BASE_ID, AIRTABLE_TABLE_NAME,
                    api_key=AIRTABLE_PAT)


def scrape_card_data(url):
    """Scrapes card data from the given URL using Playwright and Beautiful Soup."""
    with sync_playwright() as p:
        browser = p.chromium.launch()  # Consider headless=True for production
        page = browser.new_page()
        page.goto(url)
        page.wait_for_load_state("networkidle")  # Adjust timeout if needed
        html = page.content()
        browser.close()  # Close browser within the context manager

    soup = BeautifulSoup(html, "lxml")  # Specify parser explicitly
    # issue with Eustass "Captain" Kid I think we should remove the "characters"
    names = [a.text.strip() for a in soup.find_all("a", class_="pdp-url")]
    numbers = [td.text.strip() for td in soup.select("tr td:nth-child(7)")]
    prices = [td.text.strip() for td in soup.select("tr td:nth-child(8)")]
    return names, numbers, prices


def insert_or_update_record(record_data, primary_key_field="id"):
    """Inserts or updates a record in Airtable."""
    try:
        id_to_check = record_data.get(primary_key_field)
        if not id_to_check:
            raise ValueError(
                f"Primary key field '{primary_key_field}' is missing.")

        filter_by_id = f'{primary_key_field}="{id_to_check}"'
        existing_records = airtable.get_all(formula=filter_by_id)

        if existing_records:
            existing_record = existing_records[0]
            record_id_to_update = existing_record['id']
            airtable.update(record_id_to_update, record_data)
            print(f"Record with {primary_key_field} '{id_to_check}' updated.")
        else:
            airtable.insert(record_data)
            print(f"Record with {primary_key_field} '{id_to_check}' inserted.")

    except Exception as e:
        print(f"Error inserting/updating record: {e}")


def process_and_upload_data(names, numbers, prices):
    """Processes the scraped data and uploads it to Airtable."""
    min_length = min(len(names), len(numbers), len(prices))
    for i in range(min_length):
        number = numbers[i]
        if not number:
            print(f"Skipping record at index {i}: No number found.")
            continue

        try:
            name = names[i]
            price = prices[i]

            record_data = {
                "id": name,
                "number": number,
                "price": price
            }
            insert_or_update_record(record_data)

        except Exception as e:  # Catch general errors
            print(f"General error at index {i}: {e}")


if __name__ == "__main__":  # Best practice: main function
    names, numbers, prices = scrape_card_data(SCRAPE_URL)
    process_and_upload_data(names, numbers, prices)
