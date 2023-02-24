import 'package:flutter/material.dart';
import 'package:local_now_app/home.dart';
import '../models/message_pred80.dart';
import '../widgets/custom_style.dart';
import '../widgets/gauge.dart';
import '../widgets/survey_result_chart.dart';

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
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '80년 후 ${MessagePred80.sido}의',
                  style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                ),
                Text(
                  '지방 소멸 위험도!',
                  style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 350, child: Gauge()),
              ],
            ),
          ),
          Positioned(
            top: 380,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffD8D8D8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Image.asset(
                            //   "images/marker1.PNG",
                            //   width: 15,
                            // ),
                            Text(
                                ' 내가 만든 소멸 위험도: ${MessagePred80.change80.toStringAsFixed(2)}'),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 440,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD8D8D8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image.asset(
                        //   "images/marker2.PNG",
                        //   width: 15,
                        // ),
                        Text(
                            '80년 후 소멸 위험도: ${MessagePred80.pred80.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 200,
            right: 100,
            child: ElevatedButton(
              style: CustomStyle().primaryButtonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SurveyResultChart(),
                    ));
              },
              child: const Text('차트 보기'),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 100,
            child: ElevatedButton(
              style: CustomStyle().primaryButtonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              child: const Text('확인'),
            ),
          ),
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
