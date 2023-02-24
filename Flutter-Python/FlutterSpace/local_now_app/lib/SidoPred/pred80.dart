import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_now_app/SidoPred/pred80_result.dart';
import 'package:local_now_app/models/message_pred80.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message_last_values.dart';
import '../widgets/custom_style.dart';

class Pred80 extends StatefulWidget {
  const Pred80({super.key});

  @override
  State<Pred80> createState() => _Pred80State();
}

class _Pred80State extends State<Pred80> {
  // late double result;
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

  late int count;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('latestValue')
            .where('sido', isEqualTo: '서울특별시')
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text('80년 후 ${message.sido}는?',
                style: CustomStyle().primaryTextStyle(Colors.teal[900])),
          ),
          // // 위젯 만들면 클릭이 안 되고 바뀌지도 않음..
          // SizedBox(
          //   height: 100,
          //   width: 350,
          //   child: MySlider(),
          // ),
          Text('예상 전출인구 수: ${changeOutPop.round()}'),
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
              print('newValue: ${newValue.round()}');
              int outPop = message.outPop;
              changeOutPop = outPop * (1 + (newValue / 100));

              print('change: ${changeOutPop.round()}');
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text('출생아 수: ${changeBabies.round()}'),
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
          const SizedBox(
            height: 20,
          ),
          Text('산부인과 의원 수: ${changeDoctors.round()}'),
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
          const SizedBox(
            height: 20,
          ),
          Text('초등학생 인원 수: ${changeStudents.round()}'),
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
          const SizedBox(
            height: 20,
          ),
          Text('도소매업 신생 기업 수: ${changeCompanies.round()}'),
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
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: CustomStyle().primaryButtonStyle(),
            onPressed: () async {
              // 예측 머신러닝
              await getChangePred();
              await get80Value();

              // 결과 페이지로 넘어감
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Pred80Result();
                },
              ));
            },
            child: const Text('결과 확인'),
          ),
          // LineChartSample6(),
        ],
      ),
    );
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

    print('get: $changeOutPop');
    print('예측값: ${result}');

    setState(() {});
    // print('change80: ${result}');
  }

  // 이대로 변하지 않으면 80년 뒤에 예측되는 값
  get80Value() async {
    Map<String, dynamic> result;
    var url = Uri.parse('http://localhost:5000/seoul?year=2103');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];

    // 받아온 값 넣기
    MessagePred80.pred80 = result['pre'];

    setState(() {});
  }
}
