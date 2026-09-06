import requests

r = requests.get("https://gradetv.net/api/channels", params={"country": "BR", "playable": 1}, timeout=30).json()
print(sorted(r.keys()))
