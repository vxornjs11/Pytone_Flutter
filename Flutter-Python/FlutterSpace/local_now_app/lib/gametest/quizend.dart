import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../kakao_link/kakaoapi.dart';
import 'c_Alert.dart';
import 'c_Alertok.dart';
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
  final controller = TextEditingController();
  Alertclass alert = Alertclass();
  AlertOK arletok = AlertOK();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = widget.q3point;
    // Alertclass alert = Alertclass();
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
            TextField(controller: controller),
            ElevatedButton(
                onPressed: () async {
                  final userName = controller.text;
                  final quizPoint = result;
                  String newUsername = userName;
                  bool isTaken =
                      await isUsernameTaken(newUsername: newUsername);
                  if (isTaken == false) {
                    // flase일 경우 Firebase에 같은 아이디가 없는 것이다.
                    creatUser(name: userName.toString(), point: quizPoint);
                    // 완료Alert창을 띄워주며 text를 초기화
                    arletok.Alertokay(context);
                    controller.text = "";
                  } else {
                    // 아이디 중복으로 실패
                    alert.Alert(context);
                  }
                },
                child: const Text("랭킹 등록")),
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

  // data 2023/02/24
  // Firebase userName 중복 체크 -----
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('ranks');

  Future<bool> isUsernameTaken({required String newUsername}) async {
    final QuerySnapshot result =
        await usersCollection.where('userName', isEqualTo: newUsername).get();
    return result.docs.isNotEmpty;
  }
  // Firebase userName 중복 체크 -----

  Future creatUser({required String name, required int point}) async {
    final docUser = FirebaseFirestore.instance.collection('ranks').doc();

    final user = User(
      // id: name,
      name: name,
      point: point,
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}

///

class User {
  // String id;
  final String name;
  final int point;

  User({
    // this.id = "",
    required this.name,
    required this.point,
  });

  Map<String, dynamic> toJson() => {
        // "id": id,
        "userName": name,
        "quizPoint": point,
      };
}
