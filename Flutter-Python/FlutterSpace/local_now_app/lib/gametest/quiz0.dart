import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:local_now_app/gametest/quiz1.dart';

class quiz0 extends StatefulWidget {
  const quiz0({super.key});

  @override
  State<quiz0> createState() => _quiz0State();
}

class _quiz0State extends State<quiz0> {
  late String result = "";
  late int point = 0;
  late List<String> sido = ["경기도", "제주도", "전라남도"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Q1. 2022년 대한민국에서 가장 지방소멸위험지수가 높은 지방은?",
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
                            width: 80,
                            height: 50,
                            color: Colors.green.withOpacity(0.5),
                            child: const Text(
                              "저엉답은??",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 80,
                            height: 50,
                            color: Colors.amber,
                            child: Center(
                              child: Text(si),
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
                    // width: 200,
                    height: 80,
                    color: Colors.blue.shade100,
                    child: Center(
                      child: Text(
                        result,
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
                onPressed: () {
                  if (result == "제주도") {
                    point = 1;
                  } else {
                    point = 0;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quiz1(point),
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

