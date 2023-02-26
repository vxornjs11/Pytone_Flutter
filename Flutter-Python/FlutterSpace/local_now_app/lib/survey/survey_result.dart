import 'dart:convert';
import 'dart:ffi';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:local_now_app/home.dart';
import 'package:local_now_app/models/message_answers.dart';
import 'package:local_now_app/models/message_sido.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  _ResultPageState();

  late double result;

  @override
  void initState() {
    super.initState();
    getEstimateValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("나만의 지역의 지방 소멸 위험도"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '나만의 지역의 소멸 위험도는 ${MessageAnswers.estateValue.toStringAsFixed(2)} 입니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Lottie.asset('images/moving.zip'),
            Text(
              '나만의 지역의 소멸 위험도는 1에 가까울수록 위험합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // 값 저장하고 결과 페이지로)
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Text('Home으로'),
            ),
          ],
        ));
  }

// 지방 소멸 위험 예측값
  getEstimateValue() async {
    var url = Uri.parse(
        'http://127.0.0.1:5000/all?pop=${MessageAnswers.sliderPop * 250000}&babies=${MessageAnswers.sliderBabies * 15000}&doctors=${MessageAnswers.sliderDoctor * 50}&students=${MessageAnswers.sliderEStudent * 100000}&companies=${MessageAnswers.sliderCompanies * 8000}');
    var response = await http.get(url);
    print(response.body);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    // 받아온 값 넣기

    MessageAnswers.estateValue = result;
    print(MessageAnswers.estateValue);
    setState(() {});
  }
}
