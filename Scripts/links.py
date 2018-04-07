import requests
from bs4 import BeautifulSoup

r = requests.get("https://www.sports-reference.com/cbb/play-index/matchup_finder.cgi?request=1&year_min=2008&year_max=2017&comp_school=le&rank_school=ANY&comp_opp=le&rank_opp=ANY&game_type=A&game_result=W&order_by=date_game")

#transform it into BeautifulSoup object
c = r.content
soup = BeautifulSoup(c)

links = list(soup.find_all("a"))

for x in range(0, len(links)):
	print(links[x])

#[i for i in x if i.find('BoxScore')==False]
