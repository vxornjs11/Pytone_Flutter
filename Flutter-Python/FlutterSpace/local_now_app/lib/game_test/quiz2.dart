import 'package:flutter/material.dart';
import 'package:local_now_app/game_test/quiz_end.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_style.dart';

class Quiz2 extends StatefulWidget {
  final int q2point;
  const Quiz2(this.q2point, {super.key});

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  late String result = "";
  late int Q3point = 0;
  late List<String> sido = ["강원도", "충청북도", "서울특별시"];

  @override
  void initState() {
    // implement initState
    super.initState();
    Q3point = widget.q2point;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: 'Quiz'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 90,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Q3. 다음중 전년도 대비 초등학교 수가 적어진 곳은 (2022년 기준)?",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // for 반복문으로 Draggable를 실행.
                  for (String si in sido)
                    Row(
                      children: [
                        Draggable(
                          data: si,
                          onDraggableCanceled: (velocity, offset) {},
                          feedback: Container(
                            width: 100,
                            height: 50,
                            decoration: CustomStyle()
                                .primaryBoxStyle(Colors.green.withOpacity(0.5)),
                            child: const Text(
                              "저엉답은??",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: CustomStyle()
                                .primaryBoxStyle(Colors.lightBlue.shade200),
                            child: Center(
                              child: Text(
                                si,
                                style: CustomStyle()
                                    .secondaryTextStyle(Colors.indigo),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              DragTarget(
                onAccept: (String data) {
                  result = data;
                },
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return Container(
                    width: 300,
                    height: 80,
                    decoration:
                        CustomStyle().primaryBoxStyle(Colors.blue.shade100),
                    child: Center(
                      child: Text(
                        result == "" ? "정답을 끌어다 놓아주세요!" : result,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () {
                  if (result == "충청북도") {
                    Q3point = Q3point + 1;
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizEnd(Q3point),
                      ),
                      (route) => false);
                },
                child: const Text("정답제출"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
