import 'package:flutter/material.dart';
import 'package:local_now_app/game_test/quiz1.dart';
import 'package:local_now_app/widgets/custom_app_bar.dart';
import 'package:local_now_app/widgets/custom_style.dart';

class Quiz0 extends StatefulWidget {
  const Quiz0({super.key});

  @override
  State<Quiz0> createState() => _Quiz0State();
}

class _Quiz0State extends State<Quiz0> {
  late String result = "";
  late int point = 0;
  late List<String> sido = ["경기도", "제주도", "전라남도"];
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
                "Q1. 2022년 대한민국에서 가장 지방소멸위험지수가 높은 지방은?",
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: CustomStyle()
                                .primaryBoxStyle(Colors.lightBlue.shade200),
                            width: 100,
                            height: 50,
                            // color: Colors.amber,
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
                    // color: Colors.blue.shade100,
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
                  if (result == "제주도") {
                    point = 1;
                  } else {
                    point = 0;
                  }
                  // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz1(point),
                    ),
                  );
                },
                child: const Text("정답제출"),
              )
            ],
          ),
        ),
      ),
    );
  }
} ///

