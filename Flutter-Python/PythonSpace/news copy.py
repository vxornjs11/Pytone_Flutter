#-*- coding:utf-8 -*-
"""
Create on 2023-02-20
author : LucheSia
Descripytion: Scrapy
"""
from flask import Flask, jsonify, request, render_template
import joblib
from bs4 import BeautifulSoup
import urllib.request as req
# import sys
# import io
# sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
# sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')
app = Flask(__name__)
# app.config['JSON_AS_ASCII'] = False
# app.config['utf-8'] = True

@app.route("/news")
def news():
    url = 'http://m.kwnews.co.kr'
    # res = req.urlopen(url).decode('utf-8','replace') 
    res = req.urlopen(url)

    # headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
    # data = req.urlopen(url, headers=headers, timeout=3)

    # if data.encoding not in ['euc-kr', 'utf-8']:
    #     data.encoding = 'EUC-KR'
    # res = req.urlopen(url,encoding='euc-kr')
    # res = req.urlopen(url).encoding='euc-kr'
    # html = res.content.decode('utf-8','replace') 
    # soup = BeautifulSoup(res, "html.parser")
    soup = BeautifulSoup(res, "html.parser",encoding='euc-kr')
    # soup = BeautifulSoup(res, "html.parser",encoding='euc-kr')
    # soup = BeautifulSoup(res, "html.parser")
    # soup = BeautifulSoup(html, "html.parser")
    links = soup.select("#main_news_list_1 .title a")
    #
    # html = req.content.decode('utf-8','replace') 
    # soup = BeautifulSoup(html, 'html.parser')
    #*/
    newstitles = []
    newsLinks = []
    errorList = []
    setJSONList = []
    i = 0
    for link in links:
        try:  
            # link.text = link.text.decode('cp949').encode('utf-8')
            newstitles.append(link.text)
            newsLinks.append(url+link.attrs['href'])
        except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
        else:
            setJSONList.append({newstitles[i]:newsLinks[i]})
            i += 1

    # setJSONList = setJSONList
    return jsonify({
        'result' : setJSONList
    })

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
