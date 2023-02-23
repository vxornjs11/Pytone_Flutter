import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_now_app/Model/message_sido.dart';
import 'package:local_now_app/SidoPred/pred80_result.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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

  @override
  void initState() {
    super.initState();
    result = {};
    if (FirebaseFirestore.instance.collection('latestValue').id == '서울특별시') {
      seoul = FirebaseFirestore.instance.collection('latestValue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          const Text('80년 후 강원도!'),
          // // 위젯 만들면 클릭이 안 되고 바뀌지도 않음..
          // SizedBox(
          //   height: 100,
          //   width: 350,
          //   child: MySlider(),
          // ),
          const Text('전출인구 수'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value1,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            onChangeStart: (dynamic startValue) {
              print('Interaction started');
            },
            onChanged: (dynamic newValue) {
              _value1 = newValue;
              setState(() {});
            },
            // onChangeEnd: (dynamic endValue) {
            //   MessageSido.sliderPop = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('출생아 수'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value2,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            onChangeStart: (dynamic startValue) {
              print('Interaction started');
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value2 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   MessageSido.sliderBabies = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('산부인과 의원 수'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value3,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            onChangeStart: (dynamic startValue) {
              print('Interaction started');
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value3 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   MessageSido.sliderDoctor = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('초등학생 인원 수'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value4,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            onChangeStart: (dynamic startValue) {
              print('Interaction started');
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value4 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   MessageSido.sliderEStudent = endValue;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('도소매업 신생 기업 수'),
          SfSlider(
            min: -100,
            max: 100,
            value: _value5,
            showDividers: true,
            interval: 25,
            showLabels: true,
            showTicks: true,
            stepSize: 25,
            onChangeStart: (dynamic startValue) {
              print('Interaction started');
            },
            onChanged: (dynamic newValue) {
              setState(() {
                _value5 = newValue;
              });
            },
            // onChangeEnd: (dynamic endValue) {
            //   MessageSido.sliderCompanies = endValue;
            // },
          ),
          SizedBox(
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
