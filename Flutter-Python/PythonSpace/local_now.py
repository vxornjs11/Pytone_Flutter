# """
# Create on 2023-02-21
# author: Sangwon Kim, 호식, 예진
# Description: Flutter와 Python의 Ai의 예측값 보내기
# """

# from flask import Flask, jsonify, render_template, request # 플라스크에 대한 얘기임
# import joblib
# import pandas as pd
# import numpy as np
# from sklearn.linear_model import LinearRegression
# from bs4 import BeautifulSoup
# import urllib.request as req

# app = Flask(__name__)

# @app.route("/seoul_predict") # spring이랑 거의 비슷함    # @app.route("/__")형식으로 여러개 하면됨
# def seoul_predict():
#     outPop = float(request.args.get("outPop"))
#     birthPop = float(request.args.get("birthPop"))
#     obgynPop = float(request.args.get("obgynPop"))
#     elementNum = float(request.args.get("elementNum"))

#     lr = joblib.load("./lr_seoul_pred.h5")
#     pre = lr.predict([[outPop, birthPop, obgynPop, elementNum]])

#     return jsonify({'result' : pre[0]}) # pre의 결과를 json으로 넘겨주면 끝임


# @app.route("/seoul_gungu")
# def seoul_gungu():
#     gungu = request.args.get("gungu")
#     df = pd.read_csv("./Data/seoul_pred.csv")
#     df['pred_cluster'] = round(df['pred_cluster'],2)
    
#     # gungu = '종로구'
#     # res = df[df['군구'] == gungu]['pred_cluster'].tolist()
#     res = df[df['군구'] == gungu][['년도','pred_cluster']].to_dict('list')
#     # res1 = df[df['군구'] == gungu]['년도'].tolist()
#     # res2 = df[df['군구'] == gungu]['pred_cluster'].tolist()
#     # print(res)

#     return jsonify({'result' : res})

# @app.route("/seoul_gungu_all")
# def seoul_gungu_all():
#     df = pd.read_csv("./Data/seoul_pred.csv")
    
#     df['pred_cluster'] = round(df['pred_cluster'],2)

#     gungu_list = df['군구'].unique()
#     gungu_dict = {}

#     gungu_dict['년도'] = df['년도'].unique().tolist()
#     gungu_dict['군구'] = df['군구'].unique().tolist()
    
#     for gungu in gungu_list:
#         gungu_dict[gungu] = df['pred_cluster'][df['군구'] == gungu].tolist()
#     res = gungu_dict

#     # print(res)

#     return jsonify({'result' : res})

# # Date: 2023-02-24, sangwonKim7
# # Desc: 각 군구별 '년도에 따른 예측값'에 대한 선형회귀식 구한 후, 기울기와 절편을 Dictionary로 보냄
# @app.route("/seoul_gungu_coef_intercept")
# def seoul_gungu_coef_intercept():
#     df = pd.read_csv("./Data/seoul_2017_2021_pred.csv")
    
#     gungu_dict = {}
#     gungu_dict['군구'] = df['군구'].unique().tolist()
#     gungu_list = df['군구'].unique()

#     for gungu in gungu_list:
#         df_temp = df[df['군구'] == gungu]
#         data = df_temp[['년도']].to_numpy()
#         target = df_temp['pred_cluster'].to_numpy()

#         lr = LinearRegression()
#         lr.fit(data, target)

#         gungu_dict[gungu] = [float(lr.coef_), float(lr.intercept_)]

#     res = gungu_dict

#     return jsonify({'result' : res})

# #------------------------------------------------------------------------------------------------

# #강원도 뉴스 크롤링 
# @app.route("/newsGwangWon")
# def newsGwangWon():
#     url = 'http://m.kwnews.co.kr'
#     res = req.urlopen(url)
#     soup = BeautifulSoup(res, "html.parser")
#     links = soup.select("#main_news_list_1 .title a")

#     newstitles = []
#     newsLinks = []
#     errorList = []
#     setJSONList = []
#     i = 0
#     for link in links:
#         try:  
#             # newstitles.append(link.text)
#             newstitles.append(link.string)
#             newsLinks.append(url+link.attrs['href'])
#         except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
#         else:
#             # setJSONList.append({newstitles[i]:newsLinks[i]})
#             setJSONList.append({newstitles[i]:newsLinks[i]})
#             i += 1

#     return jsonify({
#         'result' : setJSONList
#     })

# # 충청도 뉴스 크롤링 

# @app.route("/newsChungChung")
# def newsChungChung():
#     url = 'http://www.ccnnews.co.kr/news/articleList.html?view_type=sm'
#     cungAllNewsurl = 'http://www.ccnnews.co.kr'
#     res = req.urlopen(url)
#     soup = BeautifulSoup(res, "html.parser")
#     links = soup.select(".list-titles a")

#     newstitles = []
#     newsLinks = []
#     errorList = []
#     setJSONList = []
#     i = 0
#     for link in links:
#         try:  
#             newstitles.append(link.text)
#             newsLinks.append(cungAllNewsurl+link.attrs['href'])
#         except: errorList.append(f'Error number : {str(link)} newsTitle :{link.text}')
#         else:
#             setJSONList.append({newstitles[i]:newsLinks[i]})
#             i += 1

#     return jsonify({
#         'result' : setJSONList
#     })

# #------------------------------------------------------------------------------------------------

# # 피쳐 컬럼 값 입력 -> 예측값 도출
# @app.route("/all")
# def all():
#     # 매개변수들
#     # 전출인구,	출생아수, 산부인과의원수, 초등학생인원수, 도매 및 소매업 신생
#     pop = float(request.args.get("pop"))
#     babies = float(request.args.get("babies"))
#     doctors = float(request.args.get("doctors"))
#     students = float(request.args.get("students"))
#     companies = float(request.args.get("companies"))

#     clf = joblib.load("./lr_all.h5")
#     pre = clf.predict([[pop, babies, doctors, students, companies]])

#     return jsonify({'result': pre[0]})

# # 강원도
# @app.route("/gangwon")
# def gangwon():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_강원도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경기도
# @app.route("/gyeonggi")
# def gyeonggi():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_경기도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경남
# @app.route("/gyeongnam")
# def gyeongnam():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_경상남도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경북
# @app.route("/gyeongbuk")
# def gyeongbuk():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_경상북도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경기도
# @app.route("/gwangju")
# def gwangju():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_광주광역시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경기도
# @app.route("/daegu")
# def daegu():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_대구광역시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 경기도
# @app.route("/daejeon")
# def daejeon():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_대전광역시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 부산
# @app.route("/busan")
# def busan():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_부산.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 서울
# @app.route("/seoul")
# def seoul():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_서울특별시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 울산
# @app.route("/ulsan")
# def ulsan():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_울산광역시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 인천
# @app.route("/incheon")
# def incheon():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_인천광역시.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 전남
# @app.route("/jeollanam")
# def jeollanam():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_전라남도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 전북
# @app.route("/jeollabuk")
# def jeollabuk():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_전라북도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 제주
# @app.route("/jeju")
# def jeju():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_제주특별자치도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 충남
# @app.route("/chungnam")
# def chungnam():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_충청남도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# # 충북
# @app.route("/chungbuk")
# def chungbuk():
#     # 매개변수
#     year = float(request.args.get("year"))
#     # 모델 불러오기
#     lr = joblib.load("./lr_충청북도.h5")
    
#     # lr = joblib.load("./lr_all.h5")
#     pre = float(lr.predict([[year]]))
    
#     # 보내는 결과값들
#     intercept = lr.intercept_
#     y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
#     y2 = year * float(lr.coef_) + float(lr.intercept_)
    
#     return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})




# #------------------------------------------------------------------------------------------------

# if __name__ == "__main__": # 자바의 메인 메소드
#     app.run(host="127.0.0.1", port=5000, debug=True)
