import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../models/message_seoul.dart';
import '../seoul/seoul_all_chart.dart';
import '../seoul/seoul_chart_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_loader.dart';
import '../widgets/custom_style.dart';

//
// Create on 2023-02-21
// author: Sangwon Kim
// Description: 서울 군구별 안내 페이지
//

class Seoul extends StatefulWidget {
  const Seoul({super.key});

  @override
  State<Seoul> createState() => _SeoulState();
}

class _SeoulState extends State<Seoul> {
  late TextEditingController gunguController;

  // late String imageName;
  late String gungu;
  late Map<String, dynamic> result;
  late Map<String, dynamic> resultAll;
  late bool onLoad = false;
  late int selectedItem; // 피커뷰 번호
  late bool dataOnOff; // 첫 단계일때 로티먼저 보여주기
  late List imageName;

  @override
  void initState() {
    // implement initState
    super.initState();
    gungu = '종로구';
    result = {};
    selectedItem = 0;
    getJSONData();
    dataOnOff = false;
    imageName = [
      '종로구',
      '중구',
      '용산구',
      '성동구',
      '광진구',
      '동대문구',
      '중랑구',
      '성북구',
      '강북구',
      '도봉구',
      '노원구',
      '은평구',
      '서대문구',
      '마포구',
      '양천구',
      '강서구',
      '구로구',
      '금천구',
      '영등포구',
      '동작구',
      '관악구',
      '서초구',
      '강남구',
      '송파구',
      '강동구'
    ];
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: '서울'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dataOnOff == false
                    ? AspectRatio(
                        aspectRatio: 1.0,
                        child: Lottie.asset("assets/city-skyline.json"),
                      )
                    : SeoulChartWidget(resultMap: result, gungu: gungu),
                // const SeoulChartWidget(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/seoul/${imageName[selectedItem]}.jpeg',
                        width: deviceWidth / 2.22,
                        height: deviceHeight / 3.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      width: deviceWidth / 2.22,
                      height: deviceHeight / 3.8,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        children: [
                          for (int i = 0; i < imageName.length; i++) ...[
                            Text(
                              imageName[i],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.teal[900],
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
                // Text('Selected Item: ${imageName[selectedItem]}'),

                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        // style: CustomStyle().primaryButtonStyle(),
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                        )),
                        onPressed: () {
                          // Loader 3초 후 다음 단계 실행
                          setState(() {
                            onLoad = true;
                          });
                          Future.delayed(
                            const Duration(seconds: 2),
                            () async {
                              dataOnOff = false;
                              await getJSONDataAll();
                              // setState(() {
                              // MessageSeoul.resultMap = result;
                              onLoad = false;
                              // });
                              // _showDialog(context, result);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SeoulAllChart(),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "* 서울 전체 추이 보러가기 *",
                          style: TextStyle(
                            color: Colors.orange[700],
                          ),
                        )),
                    ElevatedButton(
                      style: CustomStyle().primaryButtonStyle(),
                      onPressed: () {
                        //
                        // Loader 3초 후 다음 단계 실행
                        setState(() {
                          onLoad = true;
                        });
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            setState(() {
                              dataOnOff = true;
                              gungu = imageName[selectedItem];
                              getJSONData();

                              // MessageSeoul.gungu = gungu;
                              // MessageSeoul.resultMap = result;

                              onLoad = false;
                            });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const SeoulChart(),
                            //     ));
                            // _showDialog(context, result);
                          },
                        );
                      },
                      child: const Text('    OK    '),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 커스텀로더
          CustomLoader(onLoad: onLoad)
        ],
      ),
    );
  }

  // --- Functions ---
  getJSONData() async {
    var url = Uri.parse('http://127.0.0.1:5000/gungu?gungu=$gungu');

    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      // print("after: $result");
    });
    // _showDialog(context, result);
  }

  getJSONDataAll() async {
    var url = Uri.parse('http://127.0.0.1:5000/gungu_all');

    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      resultAll = dataConvertedJSON['result'];
      MessageSeoul.resultMap = resultAll;
    });
    // _showDialog(context, result);
  }

  _showDialog(BuildContext context, Map result) {
    // _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('위험도 예측 결과'),
          // content: Text(result['pred_cluster'].toString()),
          content: Text(
              "입력하신 년도는 \n${result['년도']} 입니다.\n\n입력하신 결과는 \n${result['pred_cluster']} 입니다."),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  //
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
} // End
