import requests
from bs4 import BeautifulSoup


def code_search(max_pages):
    page = 1
    print("Before")
    while page <= max_pages:
        print("In")
        url = 'https://www.thenewboston.com/forum/recent_activity.php?page=' + str(page)
        source_code = requests.get(url)
        plain_txt = source_code.text
        soup = BeautifulSoup(plain_txt, "html.parser")

        with open("file_name.txt", 'w', encoding='UTF-8') as inFile:
            inFile.write(plain_txt)

        for link in soup.findAll('a'):
            href = "https://www.thenewboston.com" + link.get('href')
            title = link.string
            #print(href)
            #print(title)
            get_single_item_data(href)
        page += 1

    print("After")

def get_single_item_data(item_url):
    source_code = requests.get(item_url)
    plain_txt = source_code.text
    soup = BeautifulSoup(plain_txt)

    for item_name in soup.findAll("a", {"class":"title"}):
        print(item_name.string)

code_search(1)

