import os
from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
from airtable import Airtable

# Set up your Airtable connection
AIRTABLE_PAT = os.environ.get("AIRTABLE_PAT")
AIRTABLE_BASE_ID = os.environ.get("AIRTABLE_BASE_ID")
AIRTABLE_TABLE_NAME = os.environ.get("AIRTABLE_TABLE_NAME")

if not all([AIRTABLE_PAT, AIRTABLE_BASE_ID, AIRTABLE_TABLE_NAME]):
    raise ValueError("AIRTABLE_PAT, AIRTABLE_BASE_ID, and AIRTABLE_TABLE_NAME environment variables must be set.")

airtable = Airtable(AIRTABLE_BASE_ID, AIRTABLE_TABLE_NAME, api_key=AIRTABLE_PAT)

# The URL of the page you want to scrape
url = "https://www.tcgplayer.com/categories/trading-and-collectible-card-games/one-piece-card-game/price-guides/emperors-in-the-new-world"

with sync_playwright() as p:
    # Launch a Chromium browser (you can also use Firefox or WebKit)
    browser = p.chromium.launch()
    page = browser.new_page()

    # Go to the specified URL
    page.goto(url)

    # Wait for the page to load completely (adjust timeout if needed)
    page.wait_for_load_state("networkidle")  

    # Get the page source after JavaScript execution
    html = page.content()

    # Parse the HTML with Beautiful Soup
    soup = BeautifulSoup(html, "lxml")

    # Now you can extract data using Beautiful Soup
    names = soup.find_all("a", class_="pdp-url")
    rarities = soup.select("tr td:nth-child(6)")
    numbers = soup.select("tr td:nth-child(7)")
    prices = soup.select("tr td:nth-child(8)")
    min_length = min(len(names), len(rarities), len(numbers), len(prices))

    for i in range(min_length):
        name = names[i].text.strip()
        rarity = rarities[i].text.strip()
        number = numbers[i].text.strip()
        price = float(prices[i].text.strip().removeprefix("$"))
        print(f"{name} - {rarity} - {number} - {price}")

        try:
            record = airtable.insert({
                "id": number,
                "name": name,
                "price": price
            })
            print(f"Record inserted successfully: {record}")
        except Exception as e:
            print(f"Error inserting record: {e}")

    # Close the browser
    browser.close()