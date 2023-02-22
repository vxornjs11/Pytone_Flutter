import 'package:flutter/material.dart';
import 'package:local_now_app/Seoul/seoul.dart';
import 'package:local_now_app/newsScrapy/news_main.dart';

import 'kakao_link/map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //
                },
                child: const Text('상혁')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Seoul(),
                      ));
                },
                child: const Text('상원')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const newsMain(),
                      ));
                },
                child: const Text('호식')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                child: const Text('예진')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KaKaos()));
                },
                child: const Text('태권')),
          ],
        ),
      ),
    );
  }
}
