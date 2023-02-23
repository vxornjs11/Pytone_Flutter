import 'package:flutter/material.dart';
import 'package:local_now_app/Widget/survey_result_chart.dart';

import '../Widget/gauge.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class Pred80Result extends StatefulWidget {
  const Pred80Result({super.key});

  @override
  State<Pred80Result> createState() => _Pred80ResultState();
}

class _Pred80ResultState extends State<Pred80Result> {
  late Map<String, dynamic> result;

  @override
  void initState() {
    super.initState();
    result = {};
    // get80Value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('80년 뒤 강원도의 지방 소멸 위험도'),
          SizedBox(height: 400, child: Gauge()),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SurveyResultChart(),
                    ));
              },
              child: const Text('차트 보기'))
        ],
      ),
    );
  }

  // // 이대로 변하지 않으면 80년 뒤에 예측되는 값
  // get80Value() async {
  //   var url = Uri.parse('http://localhost:5000/gang?year=2103');
  //   var response = await http.get(url);
  //   // print(response.body);
  //   // setState(() {
  //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //   result = dataConvertedJSON['result'];
  //   // });

  //   // 받아온 값 넣기
  //   ChartData.value80 = result['pre'];
  //   print(ChartData.value80);
  //   setState(() {});
  // }
}
