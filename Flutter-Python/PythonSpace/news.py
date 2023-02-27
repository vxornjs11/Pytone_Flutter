"""
Create on 2023-02-20
author : LucheSia
Descripytion: Scrapy
"""
from flask import Flask, jsonify, request, render_template
import joblib
from bs4 import BeautifulSoup
import urllib.request as req
import requests

app = Flask(__name__)

#강원도 뉴스 크롤링 
@app.route("/newsGwangWon")
def newsGwangWon():
    url = 'http://m.kwnews.co.kr'
    res = req.urlopen(url)
    soup = BeautifulSoup(res, "html.parser")
    links = soup.select("#main_news_list_1 .title a")

    newstitles = []
    newsLinks = []
    errorList = []
    setJSONList = []
    i = 0
    for link in links:
        try:  
            # newstitles.append(link.text)
            newstitles.append(link.string)
            newsLinks.append(url+link.attrs['href'])
        except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
        else:
            # setJSONList.append({newstitles[i]:newsLinks[i]})
            setJSONList.append({newstitles[i]:newsLinks[i]})
            i += 1

    return jsonify({
        'result' : setJSONList
    })

# 충청도 뉴스 크롤링 

@app.route("/newsChungChung")
def newsChungChung():
    url = 'http://www.ccnnews.co.kr/news/articleList.html?view_type=sm'
    cungAllNewsurl = 'http://www.ccnnews.co.kr'
    res = req.urlopen(url)
    soup = BeautifulSoup(res, "html.parser")
    links = soup.select(".list-titles a")

    newstitles = []
    newsLinks = []
    errorList = []
    setJSONList = []
    i = 0
    for link in links:
        try:  
            newstitles.append(link.text)
            newsLinks.append(cungAllNewsurl+link.attrs['href'])
        except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
        else:
            setJSONList.append({newstitles[i]:newsLinks[i]})
            i += 1

    return jsonify({
        'result' : setJSONList
    })


# 검색 
lines = '''page: 1
total: 35528
box_idxno: 
sc_area: A
view_type: sm
sc_word: 
'''.splitlines()
@app.route("/search")
def search():
    inputData = request.args.get("search")
    lines_change = []
    for line in lines:
        line = line.replace(' ','')
        lines_change.append(line)

    data = {}
    for line in lines_change:
        key, value = line.split(':',1)
        data[key] = value
        
    data['sc_word'] = inputData

    url = 'http://www.ccnnews.co.kr/news/articleList.html?'
    cungAllNewsurl = 'http://www.ccnnews.co.kr'
    response = requests.post(url,data=data)
    html = response.text
    soup = BeautifulSoup(html,'html.parser')


    links = soup.select(".list-titles a")
    newstitles = []
    newsLinks = []
    errorList = []
    setJSONList = []
    i = 0
    for link in links:
        try:  
            newstitles.append(link.text)
            newsLinks.append(cungAllNewsurl+link.attrs['href'])
        except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
        else:
            setJSONList.append({newstitles[i]:newsLinks[i]})
            i += 1

    return jsonify({
        'result' : setJSONList
    })

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
