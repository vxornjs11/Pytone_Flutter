import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_now_app/SidoPred/pred80_result.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Models/message_last_values.dart';
import '../models/message_sido.dart';

class Pred80 extends StatefulWidget {
  const Pred80({super.key});

  @override
  State<Pred80> createState() => _Pred80State();
}

class _Pred80State extends State<Pred80> {
  late Map<String, dynamic> result;
  late CollectionReference<Map<String, dynamic>> seoul;
  double _value1 = 0;
  double _value2 = 0;
  double _value3 = 0;
  double _value4 = 0;
  double _value5 = 0;

  late num changeOutPop;
  late num changeBabies;
  late num changeCompanies;
  late num changeDoctors;
  late num changeStudents;

  @override
  void initState() {
    super.initState();
    result = {};
    changeOutPop = 0;
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
    return Container(
      // color: Colors.amber,
      child: Column(
        children: [
          Text('80년 후 ${message.sido}!'),
          // // 위젯 만들면 클릭이 안 되고 바뀌지도 않음..
          // SizedBox(
          //   height: 100,
          //   width: 350,
          //   child: MySlider(),
          // ),
          Text('전출인구 수: ${message.outPop}'),
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
              print('newValue: ${newValue}');
              int outPop = message.outPop;
              changeOutPop = outPop * (1 + (newValue / 100));

              print('change: ${changeOutPop}');
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text('출생아 수: ${message.babies}'),
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
          Text('산부인과 의원 수: ${message.doctors}'),
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
              setState(() {
                _value3 = newValue;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text('초등학생 인원 수: ${message.students}'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value4,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            // onChangeStart: (dynamic startValue) {
            //   print('Interaction started');
            // },
            onChanged: (dynamic newValue) {
              setState(() {
                _value4 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   endValue4 = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          Text('도소매업 신생 기업 수: ${message.companies}'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value5,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            // onChangeStart: (dynamic startValue) {
            //   print('Interaction started');
            // },
            onChanged: (dynamic newValue) {
              setState(() {
                _value5 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   endValue5 = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // 값 저장하고 결과 페이지로
              MessageSido.sliderPop = _value1;
              MessageSido.sliderBabies = _value2;
              MessageSido.sliderDoctor = _value3;
              MessageSido.sliderEStudent = _value4;
              MessageSido.sliderCompanies = _value5;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  //생성자로 값을 넣어주는 부분! *******************
                  //메모리에 안 올라감 -> 보안이 굿
                  //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                  return Pred80Result();
                },
              ));
            },
            child: Text('결과 확인'),
          ),
          // LineChartSample6(),
        ],
      ),
    );
  }
}
