import requests
import json
import os
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv("CRYPTO_COMPARE_API_KEY")

denomination1 = "First Desired Denomination: "
denomination2 = "Second Desired Denomination: "

crypto_api = f"https://min-api.cryptocompare.com/data/pricemulti?fsyms={input(denomination1)},{input(denomination2)}&tsyms=ETH,BTC,XRP,DOGE,ZRX,ADA,LTC,LINK,XLM,DOT&api_key=api_key"

data = requests.get(crypto_api)
data_content = data.content
print(data_content)