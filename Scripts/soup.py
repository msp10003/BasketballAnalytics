import requests
from bs4 import BeautifulSoup, Comment

r = requests.get("https://www.sports-reference.com/cbb/boxscores/2016-11-11-villanova.html")
soup = BeautifulSoup(r.content, 'html.parser')
boxes = list(soup.find_all("tfoot"))

for comment in soup.find_all(string=lambda text:isinstance(text, Comment)):
    if 'tfoot' in comment:
        hidden_soup = BeautifulSoup(comment, 'html.parser')
        boxes.extend(list(hidden_soup.find_all("tfoot")))

data = []        

for box in boxes:
    for tr in box.find_all('tr'):
        data.append([td.text for td in tr.find_all('td')])
