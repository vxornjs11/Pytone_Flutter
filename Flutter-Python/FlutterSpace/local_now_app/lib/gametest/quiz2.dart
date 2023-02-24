import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'quizend.dart';

class quiz2 extends StatefulWidget {
  final int q2point;
  const quiz2(this.q2point, {super.key});

  @override
  State<quiz2> createState() => _quiz2State();
}

class _quiz2State extends State<quiz2> {
  late String result = "";
  late int Q3point = 0;
  late List<String> sido = ["강원도", "충청북도", "서울특별시"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Q3point = widget.q2point;
  }

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
                "Q3. 다음중 전년도 대비 초등학교 수가 적어진 곳은 (2022년 기준)?",
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
                  if (result == "충청북도") {
                    Q3point = Q3point + 1;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quizend(Q3point),
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
}
