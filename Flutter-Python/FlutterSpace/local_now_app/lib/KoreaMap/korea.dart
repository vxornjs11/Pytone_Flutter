import 'package:flutter/material.dart';
import 'package:local_now_app/SidoPred/pred80.dart';
import 'package:local_now_app/models/message_pred80.dart';
import 'package:local_now_app/widgets/custom_app_bar.dart';

class KoreaMap extends StatefulWidget {
  const KoreaMap({super.key});

  @override
  State<KoreaMap> createState() => _KoreaMapState();
}

class _KoreaMapState extends State<KoreaMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: '전국'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Center(
                child: Image.asset(
              "images/koreamap.png",
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      // Image.asset("images/koreamap.png",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      Positioned(
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.purple.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "경기도";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              "경기도",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 95,
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.cyan.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "서울특별시";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              "서울",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 150,
                          width: 40,
                          color: Colors.pink.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "인천광역시";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              "인천",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Container(
                      height: 150,
                      width: 130,
                      color: Colors.amber.withOpacity(0.7),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          MessagePred80.sido = "강원도";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pred80()));
                        },
                        child: const Text(
                          "강원도",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                // = 충남 라인
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Stack(children: [
                      Positioned(
                        child: Container(
                          height: 130,
                          width: 170,
                          color: Colors.green.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "충청북도"; //
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              "               충청북도",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 70,
                        top: 100,
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.blue.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "대전광역시";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              " 대전",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 130,
                          width: 80,
                          color: Colors.brown.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "충청남도";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              " \n" + " 충청남도",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Container(
                      height: 130,
                      width: 120,
                      color: Colors.blueGrey.shade700.withOpacity(0.7),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          MessagePred80.sido = "경상북도";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pred80()));
                        },
                        child: const Text(
                          " 경상북도",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Stack(children: [
                      Positioned(
                        child: Container(
                          height: 130,
                          width: 150,
                          color: Colors.deepPurple.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "전라북도";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pred80()));
                            },
                            child: const Text(
                              "전라북도",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 100,
                        child: Container(
                          height: 35,
                          width: 50,
                          color: Colors.blue.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              MessagePred80.sido = "광주광역시";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pred80()));
                            },
                            child: const Text(
                              "광주광역시",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 160,
                            color: Colors.orange.withOpacity(0.7),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                MessagePred80.sido = "경상남도";
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pred80()));
                              },
                              child: const Text(
                                "\n\n\n\n\n 경상남도",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          top: 30,
                          child: Container(
                            height: 49,
                            width: 45,
                            color: Colors.blue.withOpacity(0.7),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                MessagePred80.sido = "대구광역시";
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pred80()));
                              },
                              child: const Text(
                                " 대구",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 45,
                          child: Container(
                            height: 50,
                            width: 40,
                            color: Colors.lime.withOpacity(0.7),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                MessagePred80.sido = "울산광역시";
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pred80()));
                              },
                              child: const Text(
                                "울산",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 105,
                          child: Container(
                            height: 30,
                            width: 60,
                            color: Colors.blue.withOpacity(0.7),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  MessagePred80.sido = "부산광역시";
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pred80()));
                              },
                              child: const Text(
                                "부산",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 140,
                            width: 170,
                            color: Colors.deepOrangeAccent.withOpacity(0.7),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                MessagePred80.sido = "전라남도";
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pred80()));
                              },
                              child: const Text(
                                "전라남도",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: Colors.orange.withOpacity(0.7),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          MessagePred80.sido = "제주특별자치도";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Pred80(),
                            ),
                          );
                        },
                        child: const Text(
                          "제주특별자치도",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
