import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_now_app/game_test/easygame.dart';
import 'package:local_now_app/game_test/list.dart';
import 'package:local_now_app/home.dart';
import 'package:local_now_app/widgets/custom_app_bar.dart';
import 'package:local_now_app/widgets/custom_bottom_nav_bar.dart';
import 'package:local_now_app/widgets/custom_style.dart';

import '../kakao_link/kakaoapi.dart';
import 'c_Alert.dart';
import 'c_Alertok.dart';
import 'game_page.dart';

class QuizEnd extends StatefulWidget {
  final int q3point;
  const QuizEnd(this.q3point, {super.key});

  @override
  State<QuizEnd> createState() => _QuizEndState();
}

class _QuizEndState extends State<QuizEnd> {
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
    // implement initState
    super.initState();
    result = widget.q3point;
    // Alertclass alert = Alertclass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: "퀴즈 결과"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
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
              Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: "이름을 입력해주세요!"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: CustomStyle().primaryButtonStyle(),
                      onPressed: () async {
                        final userName = controller.text;
                        final quizPoint = result;
                        String newUsername = userName;
                        bool isTaken =
                            await isUsernameTaken(newUsername: newUsername);
                        if (isTaken == false && userName != "") {
                          // flase일 경우 Firebase에 같은 아이디가 없는 것이다.
                          creatUser(
                              name: userName.toString(), point: quizPoint);
                          // 완료Alert창을 띄워주며 text를 초기화
                          arletok.Alertokay(context);
                          controller.text = "";
                        } else {
                          // 아이디 중복으로 실패
                          alert.Alert(context);
                        }
                      },
                      child: const Text("랭킹 등록")),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: CustomStyle().primaryButtonStyle(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Ranking(),
                          ),
                        );
                      },
                      child: const Text("랭킹 보기")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: CustomStyle().secondaryButtonStyle(),
                    // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      point = "나의 테스트 점수는 " + result.toString() + "점";
                      kakaolink.kakao(profiletitle, userName, point);
                      // kakao();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage("images/symbol_kakao.png"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        ),
                        const Text(
                          "공유하기",
                        ),
                        // SizedBox(width: 70,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: CustomStyle().secondaryButtonStyle(),
                    // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CustomBottomNavBar(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "홈으로 돌아가기",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
