"""
Create on 2023-02-20
author : LucheSia
Descripytion: Scrapy
"""
from flask import Flask, jsonify, request, render_template
import joblib
from bs4 import BeautifulSoup
import urllib.request as req

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




if __name__ == "__main__":
    app.run(host="192.168.10.119", port=5001, debug=True)
