import 'package:flutter/material.dart';
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
        title: Center(child: const Text('Local Extinction &\n        Kingdom')),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Text(
                "나만의 지역 만들기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            // Load a Lottie file from your assets
            Lottie.asset(
                'images/my-dream-inspection-graphics-and-animations-v071.zip'),
            //LottieImageAsset(width: 0, height: 0, id: id, fileName: fileName, dirName: dirName)
            // Load a Lottie file from your assets
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
                child: const Text('나만의 왕국 속으로')),
            Center(
              child: Text(
                "우리나라 지역별 예측해보기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Lottie.asset('images/loupe-on-map.zip'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
                child: const Text('상혁')),
          ],
        ),
      ),
    );
  }
}
