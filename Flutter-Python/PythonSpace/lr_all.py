"""
Create on 2023-02-06
author: yejin
Description: 예측값 
"""

from flask import Flask, jsonify, render_template, request
import joblib

app = Flask(__name__)

# 피쳐 컬럼 값 입력 -> 예측값 도출
@app.route("/all")
def all():
    # 매개변수들
    # 전출인구,	출생아수, 산부인과의원수, 초등학생인원수, 도매 및 소매업 신생
    pop = float(request.args.get("pop"))
    babies = float(request.args.get("babies"))
    doctors = float(request.args.get("doctors"))
    students = float(request.args.get("students"))
    companies = float(request.args.get("companies"))

    clf = joblib.load("./lr_all.h5")
    pre = clf.predict([[pop, babies, doctors, students, companies]])

    return jsonify({'result': pre[0]})

# 강원도
@app.route("/gangwon")
def gangwon():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_강원도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경기도
@app.route("/gyeonggi")
def gyeonggi():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_경기도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경남
@app.route("/gyeongnam")
def gyeongnam():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_경상남도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경북
@app.route("/gyeongbuk")
def gyeongbuk():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_경상북도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경기도
@app.route("/gwangju")
def gwangju():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_광주광역시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경기도
@app.route("/daegu")
def daegu():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_대구광역시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 경기도
@app.route("/daejeon")
def daejeon():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_대전광역시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 부산
@app.route("/busan")
def busan():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_부산.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 서울
@app.route("/seoul")
def seoul():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_서울특별시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 울산
@app.route("/ulsan")
def ulsan():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_울산광역시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 인천
@app.route("/incheon")
def incheon():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_인천광역시.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 전남
@app.route("/jeollanam")
def jeollanam():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_전라남도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 전북
@app.route("/jeollabuk")
def jeollabuk():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_전라북도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 제주
@app.route("/jeju")
def jeju():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_제주특별자치도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 충남
@app.route("/chungnam")
def chungnam():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_충청남도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 충북
@app.route("/chungbuk")
def chungbuk():
    # 매개변수
    year = float(request.args.get("year"))
    # 모델 불러오기
    lr = joblib.load("./lr_충청북도.h5")
    
    # lr = joblib.load("./lr_all.h5")
    pre = float(lr.predict([[year]]))
    
    # 보내는 결과값들
    intercept = lr.intercept_
    y1 = 2013 * float(lr.coef_) + float(lr.intercept_)
    y2 = year * float(lr.coef_) + float(lr.intercept_)
    
    return jsonify({'result':{'y1': y1, 'y2': y2, 'pre':pre}})

# 메인 메소드
if __name__ == "__main__":
    app.run(host='127.0.0.1', port=5000, debug=True)