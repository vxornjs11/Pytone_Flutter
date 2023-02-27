import 'package:flutter/material.dart';
import 'package:local_now_app/survey/survey_baby_page.dart';
import 'package:local_now_app/widgets/custom_style.dart';
import 'package:lottie/lottie.dart';

import '../widgets/custom_app_bar.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: '나만의 지역 만들기'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Lottie.asset(
                'images/my-dream-inspection-graphics-and-animations-v071.zip'),
            ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BabyPage(),
                      ));
                },
                child: const Text('시작하기')),
          ],
        ),
      ),
    );
  }
}
