"""
Create on 2023-02-21
author: Sangwon Kim
Description: Flutter와 Python의 Ai의 예측값 보내기
"""

from flask import Flask, jsonify, render_template, request # 플라스크에 대한 얘기임
import joblib
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression

app = Flask(__name__)

@app.route("/seoul") # spring이랑 거의 비슷함    # @app.route("/__")형식으로 여러개 하면됨
def seoul():
    outPop = float(request.args.get("outPop"))
    birthPop = float(request.args.get("birthPop"))
    obgynPop = float(request.args.get("obgynPop"))
    elementNum = float(request.args.get("elementNum"))

    lr = joblib.load("./PythonSpace/lr_seoul_pred.h5")
    pre = lr.predict([[outPop, birthPop, obgynPop, elementNum]])

    return jsonify({'result' : pre[0]}) # pre의 결과를 json으로 넘겨주면 끝임


@app.route("/gungu")
def seoul_gungu():
    gungu = request.args.get("gungu")
    df = pd.read_csv("./PythonSpace/Data/seoul_pred.csv")
    df['pred_cluster'] = round(df['pred_cluster'],2)
    
    # gungu = '종로구'
    # res = df[df['군구'] == gungu]['pred_cluster'].tolist()
    res = df[df['군구'] == gungu][['년도','pred_cluster']].to_dict('list')
    # res1 = df[df['군구'] == gungu]['년도'].tolist()
    # res2 = df[df['군구'] == gungu]['pred_cluster'].tolist()
    # print(res)

    return jsonify({'result' : res})

@app.route("/gungu_all")
def seoul_gungu_all():
    df = pd.read_csv("./PythonSpace/Data/seoul_pred.csv")
    
    df['pred_cluster'] = round(df['pred_cluster'],2)

    gungu_list = df['군구'].unique()
    gungu_dict = {}

    gungu_dict['년도'] = df['년도'].unique().tolist()
    gungu_dict['군구'] = df['군구'].unique().tolist()
    
    for gungu in gungu_list:
        gungu_dict[gungu] = df['pred_cluster'][df['군구'] == gungu].tolist()
    res = gungu_dict

    # print(res)

    return jsonify({'result' : res})

# Date: 2023-02-24, sangwonKim7
# Desc: 각 군구별 '년도에 따른 예측값'에 대한 선형회귀식 구한 후, 기울기와 절편을 Dictionary로 보냄
@app.route("/gungu_coef_intercept")
def seoul_gungu_coef_intercept():
    df = pd.read_csv("./PythonSpace/Data/seoul_2017_2021_pred.csv")
    
    gungu_dict = {}
    gungu_dict['군구'] = df['군구'].unique().tolist()
    gungu_list = df['군구'].unique()

    for gungu in gungu_list:
        df_temp = df[df['군구'] == gungu]
        data = df_temp[['년도']].to_numpy()
        target = df_temp['pred_cluster'].to_numpy()

        lr = LinearRegression()
        lr.fit(data, target)

        gungu_dict[gungu] = [float(lr.coef_), float(lr.intercept_)]

    res = gungu_dict

    return jsonify({'result' : res})


# 내가실행하는게 아니라 플러터에서 실행하는것   # 파이썬에서는 런메소드가 제일 뒤에 있다.
if __name__ == "__main__": # 자바의 메인 메소드
    app.run(host="127.0.0.1", port=5000, debug=True)


# 크롬으로 잘돌아가는지 확인하고, 소스보기로 이상한 소스 없는지도 확인하기 <