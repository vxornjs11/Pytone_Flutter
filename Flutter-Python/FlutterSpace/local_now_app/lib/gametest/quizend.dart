import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../kakao_link/kakaoapi.dart';
import 'game.dart';

class quizend extends StatefulWidget {
  final int q3point;
  const quizend(this.q3point, {super.key});

  @override
  State<quizend> createState() => _quizendState();
}

class _quizendState extends State<quizend> {
  var kakaolink = Kakaolink_api();
  late int result = 0;
  late String profiletitle = 'local_now';
  // profiletitle = 우리 앱 이름
  late String userName = 'User Name';
  late String point = '100점';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = widget.q3point;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("퀴즈 결과"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("당신의 점수는", style: TextStyle(fontSize: 30)),
                Text(
                  " $result 점 ",
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const Text("입니다!", style: TextStyle(fontSize: 30)),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => gamePage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "돌아가기",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                point = "나의 테스트 점수는 " + result.toString() + "점";
                kakaolink.kakao(profiletitle, userName, point);
                // kakao();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/symbol_kakao.png",
                    width: 70,
                    height: 70,
                  ),
                  const Text(
                    "     친구들과 공유하기",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
