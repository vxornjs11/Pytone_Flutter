import 'package:flutter/material.dart';
import 'package:local_now_app/survey/survey_baby_page.dart';
import 'package:local_now_app/survey/survey_moving_page.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 지역 만들기'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
              'images/my-dream-inspection-graphics-and-animations-v071.zip'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BabyPage(),
                    ));
              },
              child: const Text('나만의 지역 만들기')),
        ],
      ),
    );
  }
}
