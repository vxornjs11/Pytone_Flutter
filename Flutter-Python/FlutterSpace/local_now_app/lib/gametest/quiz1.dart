import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:local_now_app/gametest/quiz2.dart';

class quiz1 extends StatefulWidget {
  final int point;
  const quiz1(this.point, {super.key});
  @override
  State<quiz1> createState() => _quiz1State();
}

class _quiz1State extends State<quiz1> {
  late String result = "";
  late int Q2point = 0;
  late List<String> sido = ["경기도", "서울특별시", "대구광역시"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Q2point = widget.point;
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
                "Q2. 2022년 전출인구가 많은 지방은?",
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
                  if (result == "경기도") {
                    Q2point = Q2point + 1;
                  }
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quiz2(Q2point),
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
