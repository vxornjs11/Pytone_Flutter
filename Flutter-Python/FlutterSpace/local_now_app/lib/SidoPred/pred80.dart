import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_now_app/SidoPred/pred80_result.dart';
import 'package:local_now_app/models/message_pred80.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message_last_values.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_loader.dart';
import '../widgets/custom_style.dart';

class Pred80 extends StatefulWidget {
  const Pred80({super.key});

  @override
  State<Pred80> createState() => _Pred80State();
}

class _Pred80State extends State<Pred80> {
  late CollectionReference<Map<String, dynamic>> seoul;

  // 슬라이더 값
  late double _value1;
  late double _value2;
  late double _value3;
  late double _value4;
  late double _value5;

  // 계산되어 바뀌는 컬럼 값
  late num changeOutPop;
  late num changeBabies;
  late num changeCompanies;
  late num changeDoctors;
  late num changeStudents;

  // 라벨에 값을 한번만 초기화해주기 위해 카운트한다.
  late int count;

  // 로티
  late bool onLoad;

  // 시도별로 다른 모델을 호출하기 위한 변수
  late String linkSido;

  @override
  void initState() {
    super.initState();
    _value1 = 0;
    _value2 = 0;
    _value3 = 0;
    _value4 = 0;
    _value5 = 0;

    changeOutPop = 0;
    changeBabies = 0;
    changeCompanies = 0;
    changeDoctors = 0;
    changeStudents = 0;

    count = 0;

    onLoad = false;

    linkSido = "";
    getLinkSido();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBar: AppBar(), title: '80년 후 ${MessagePred80.sido}는?'),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('latestValue')
            .where('sido', isEqualTo: MessagePred80.sido)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CupertinoActivityIndicator());
          }
          final documents = snapshot.data!.docs;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: documents.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final message = MessageLastValues(
      sido: doc['sido'],
      babies: doc['babies'],
      companies: doc['companies'],
      doctors: doc['doctors'],
      outPop: doc['out_pop'],
      students: doc['students'],
    );

    count += 1;

    MessagePred80.sido = message.sido;

    if (count == 1) {
      changeBabies = doc['babies'];
      changeCompanies = doc['companies'];
      changeDoctors = doc['doctors'];
      changeOutPop = doc['out_pop'];
      changeStudents = doc['students'];
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              //   child: Text('80년 후 ${message.sido}는?',
              //       style: CustomStyle().primaryTextStyle(Colors.teal[900])),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '예상 전출인구 수: ${changeOutPop.round()}명',
                      style: CustomStyle()
                          .secondaryTextStyle(const Color(0xff495464)),
                    ),
                  ],
                ),
              ),
              SfSlider(
                min: -100,
                max: 100,
                value: _value1,
                showDividers: true,
                interval: 25,
                showLabels: true,
                showTicks: true,
                stepSize: 25,
                onChanged: (dynamic newValue) {
                  _value1 = newValue;

                  int outPop = message.outPop;
                  changeOutPop = outPop * (1 + (newValue / 100));

                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(단위: %)',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      '출생아 수: ${changeBabies.round()}명',
                      style: CustomStyle()
                          .secondaryTextStyle(const Color(0xff495464)),
                    ),
                  ),
                ],
              ),
              SfSlider(
                min: -100,
                max: 100,
                value: _value2,
                showDividers: true,
                interval: 25,
                showLabels: true,
                showTicks: true,
                stepSize: 25,
                onChanged: (dynamic newValue) {
                  _value2 = newValue;

                  int babies = message.babies;
                  changeBabies = babies * (1 + (newValue / 100));

                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(단위: %)',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      '산부인과 의원 수: ${changeDoctors.round()}개',
                      style: CustomStyle()
                          .secondaryTextStyle(const Color(0xff495464)),
                    ),
                  ),
                ],
              ),
              SfSlider(
                min: -100,
                max: 100,
                value: _value3,
                showDividers: true,
                interval: 25,
                showLabels: true,
                showTicks: true,
                stepSize: 25,
                onChanged: (dynamic newValue) {
                  _value3 = newValue;

                  int doctors = message.doctors;
                  changeDoctors = doctors * (1 + (newValue / 100));

                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(단위: %)',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      '초등학생 인원 수: ${changeStudents.round()}명',
                      style: CustomStyle()
                          .secondaryTextStyle(const Color(0xff495464)),
                    ),
                  ),
                ],
              ),
              SfSlider(
                min: -100,
                max: 100,
                value: _value4,
                showDividers: true,
                interval: 25,
                showLabels: true,
                showTicks: true,
                stepSize: 25,
                onChanged: (dynamic newValue) {
                  _value4 = newValue;

                  int students = message.babies;
                  changeStudents = students * (1 + (newValue / 100));

                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(단위: %)',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      '도소매업 신생 기업 수: ${changeCompanies.round()}개',
                      style: CustomStyle()
                          .secondaryTextStyle(const Color(0xff495464)),
                    ),
                  ),
                ],
              ),
              SfSlider(
                min: -100,
                max: 100,
                value: _value5,
                showDividers: true,
                interval: 25,
                showLabels: true,
                showTicks: true,
                stepSize: 25,
                onChanged: (dynamic newValue) {
                  _value5 = newValue;

                  int companies = message.babies;
                  changeCompanies = companies * (1 + (newValue / 100));

                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(단위: %)',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () async {
                  // 예측 머신러닝
                  await getChangePred();
                  await get80Value();

                  setState(() {
                    onLoad = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      onLoad = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pred80Result(),
                        ));
                  });
                },
                child: const Text('결과 확인'),
              ),
            ],
          ),
          CustomLoader(onLoad: onLoad)
        ],
      ),
    );
  }

  // 시도별로 다른 함수 이름을 리턴
  getLinkSido() {
    List<String> strSidos = [
      '경기도',
      '서울특별시',
      '경상남도',
      '부산광역시',
      '대구광역시',
      '인천광역시',
      '전라북도',
      '경상북도',
      '광주광역시',
      '충청남도',
      '전라남도',
      '울산광역시',
      '충청북도',
      '대전광역시',
      '강원도',
      '제주특별자치도'
    ];

    List<String> linkSidos = [
      'gyeonggi',
      'seoul',
      'gyeongnam',
      'busan',
      'daegu',
      'incheon',
      'jeollabuk',
      'gyeongbuk',
      'gwangju',
      'chungnam',
      'jeollanam',
      'ulsan',
      'chungbuk',
      'deajeon',
      'gangwon',
      'jeju'
    ];

    int index = 0;

    for (var sido in strSidos) {
      if (MessagePred80.sido == sido) {
        linkSido = linkSidos[index];
        break;
      }
      index += 1;
    }
  }

  // 입력값 넣어서 예측값 도출하는 머신러닝 함수
  getChangePred() async {
    double result;
    var url = Uri.parse(
        'http://localhost:5000/all?pop=${changeOutPop.round()}&babies=${changeBabies.round()}&doctors=${changeDoctors.round()}&students=${changeStudents.round()}&companies=${changeCompanies.round()}');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];

    MessagePred80.change80 = result;

    setState(() {});
  }

  // 이대로 변하지 않으면 80년 뒤에 예측되는 값
  get80Value() async {
    Map<String, dynamic> result;
    var url = Uri.parse('http://localhost:5000/$linkSido?year=2103');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];

    // 받아온 값 넣기
    MessagePred80.pred80 = result['pre'];

    setState(() {});
  }
}
