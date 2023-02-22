import 'package:flutter/material.dart';
import 'package:local_now_app/Widget/line_chart2.dart';

// import 'line_chart2.dart';
// import 'package:my_test_project_app/line_chart1.dart';
// import 'package:my_test_project_app/line_chart2.dart';

class SurveyResultChart extends StatefulWidget {
  const SurveyResultChart({super.key});

  @override
  State<SurveyResultChart> createState() => _SurveyResultChartState();
}

class _SurveyResultChartState extends State<SurveyResultChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        // 차트와 범례가 너무 떨어지지 않도록 Stack을 이용해 차트의 위쪽에 범례를 위치시킨다.
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffEDEDED),
                // color: Colors.white,
              ),
              child: LineChartSample2(),
            ),
            Positioned(
              top: 40,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                child: Positioned(
                  top: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.cyan,
                        height: 10,
                        width: 10,
                      ),
                      const Text(' 경기도  '),
                      Container(
                        color: Colors.green,
                        height: 10,
                        width: 10,
                      ),
                      const Text(' 울산광역시  '),
                      Container(
                        color: Colors.pink,
                        height: 10,
                        width: 10,
                      ),
                      const Text(' 경상남도  '),
                    ],
                  ),
                ),
              ),
            ),
            // Center(
            //   child: AspectRatio(
            //     aspectRatio: 1.00,
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //           borderRadius: const BorderRadius.all(Radius.circular(16)),
            //           color: Theme.of(context).primaryColorLight),
            //       child: Stack(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Container(
            //               alignment: Alignment.topCenter,
            //               child: Text(
            //                 "chart",
            //                 // widget.title,
            //                 style: const TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                   letterSpacing: 2,
            //                 ),
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //               right: 18,
            //               left: 12,
            //               top: 36,
            //               bottom: 20,
            //             ),
            //             child: LineChartSample2(),
            //             // child: LineChart(
            //             //   showAvg
            //             //       ? avgData(widget.chartData) // 유저 평균
            //             //       : mainData(widget.chartData), // 유저 날짜별 위험도 기록
            //             // ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
