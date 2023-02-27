import 'package:flutter/material.dart';
import 'package:local_now_app/game_test/quiz2.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_style.dart';

class Quiz1 extends StatefulWidget {
  final int point;
  const Quiz1(this.point, {super.key});
  @override
  State<Quiz1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  late String result = "";
  late int Q2point = 0;
  late List<String> sido = ["경기도", "서울특별시", "대구광역시"];

  @override
  void initState() {
    // implement initState
    super.initState();
    Q2point = widget.point;
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
                "Q2. 2022년 전출인구가 \n많은 지방은?",
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
                  if (result == "경기도") {
                    Q2point = Q2point + 1;
                  }
                  // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz2(Q2point),
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
