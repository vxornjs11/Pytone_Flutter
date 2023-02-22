import 'package:flutter/material.dart';
import 'package:local_now_app/seoul/seoul.dart';
import 'package:local_now_app/news_scrapy/news_main.dart';
import 'package:local_now_app/survey/first_page.dart';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ));
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
