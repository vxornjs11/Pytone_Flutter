import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/seoul/seoul.dart';

class SeoulPredict extends StatefulWidget {
  const SeoulPredict({super.key});

  @override
  State<SeoulPredict> createState() => _SeoulPredictState();
}

class _SeoulPredictState extends State<SeoulPredict> {
  late TextEditingController outPopController;
  late TextEditingController birthPopController;
  late TextEditingController obgynPopController;
  late TextEditingController elementNumController;

  late String outPop;
  late String birthPop;
  late String obgynPop;
  late String elementNum;

  late String imageName;
  String result = "all";

  @override
  void initState() {
    // implement initState
    super.initState();
    outPopController = TextEditingController();
    birthPopController = TextEditingController();
    obgynPopController = TextEditingController();
    elementNumController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
      length: 2,
      animationDuration: const Duration(seconds: 1),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            // preferredSize: const Size.fromHeight(55.0),
            child: AppBar(
              bottom: TabBar(
                tabs: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Seoul(),));
                      });
                    },
                    child: const Tab(
                      child: Text(
                        '서울',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SeoulPredict(),));
                      });
                    },
                    child: const Tab(
                      child: Text(
                        '예측',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // appBar: AppBar(
          //   title: const Text('Seoul 예측'),
          //   elevation: 0,
          //   centerTitle: true,
          // ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: outPopController,
                    decoration: const InputDecoration(labelText: '전출인구'),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true), // 소수점찍기<<
                  ),
                  TextField(
                    controller: birthPopController,
                    decoration: const InputDecoration(labelText: '출생아수'),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true), // 소수점찍기<<
                  ),
                  TextField(
                    controller: obgynPopController,
                    decoration: const InputDecoration(labelText: '산부인과의원수'),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true), // 소수점찍기<<
                  ),
                  TextField(
                    controller: elementNumController,
                    decoration: const InputDecoration(labelText: '초등학교수'),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true), // 소수점찍기<<
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      outPop = outPopController.text;
                      birthPop = birthPopController.text;
                      obgynPop = obgynPopController.text;
                      elementNum = elementNumController.text;
                      getJSONData();
                    },
                    child: const Text('입력'),
                  ),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('images/$result.jpg'),
                  //   radius: 100,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  getJSONData() async {
    var url = Uri.parse(
        // 'http://localhost:5000/iris?outPop=$outPop&birthPop=$birthPop&obgynPop=$obgynPop&petalWidth=$petalWidth');
        'http://127.0.0.1:5000/seoul_predict?outPop=$outPop&birthPop=$birthPop&obgynPop=$obgynPop&elementNum=$elementNum');
    // 크롬에서 확인하기: http://127.0.0.1:5000/iris?outPop=1.0&birthPop=1.0&obgynPop=1.0
    // comment: localhost 대신 127.0.0.1 로 써야하는 이유는 잘 모르겠다

    // 8080 에서 5000 으로 바꿔준다
    // 'http://localhost:8080/Rserve/response_iris.jsp?outPop=$outPop&birthPop=$birthPop&obgynPop=$obgynPop&petalWidth=$petalWidth');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'].toString(); // double -> String
    });
    _showDialog(context, result);
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('위험도 예측 결과'),
          content: Text('입력하신 결과는 $result 입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  imageName = result;
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
