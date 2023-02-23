import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/seoul/seoul_chart.dart';

import '../models/message_seoul.dart';
import '../widgets/custom_loader.dart';

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
  late bool onLoad = false;

  @override
  void initState() {
    // implement initState
    super.initState();
    gunguController = TextEditingController();
    result = {};
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seoul 군구별 차트'),
          elevation: 0.1,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // 피커뷰로 바꿔주기
                  // 왼쪽에는 구별 이미지 바뀌는거 보여주기
                  TextField(
                      controller: gunguController,
                      decoration: const InputDecoration(labelText: '군구'),
                      keyboardType: TextInputType.text // 소수점찍기<<
                      // keyboardType: const TextInputType.numberWithOptions(decimal: true) // 소수점찍기<<
                      ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      gungu = gunguController.text;
                      await getJSONData();
                      MessageSeoul.gungu = gungu;
                      MessageSeoul.resultMap = result;
                      // Loader 3초 후 다음 단계 실행
                      onLoad = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        onLoad = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeoulChart(),
                            ));
                        _showDialog(context, result);
                      });
                    },
                    child: const Text('입력'),
                  ),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('images/$result.jpg'),
                  //   radius: 100,
                  // ),
                  //// ---------
                  CupertinoPicker(
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        //
                      },
                      children: [
                        //
                      ])

                  //// ---------
                ],
              ),
            ),
            CustomLoader(onLoad: onLoad)
            // Center(
            //     child: onLoad
            //         ? SizedBox(
            //             width: 200,
            //             child: Lottie.network(
            //                 'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'),
            //             // 'https://assets7.lottiefiles.com/packages/lf20_c5vj9laj.json'),
            //           )
            //         : const SizedBox()),
          ],
        ),
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
