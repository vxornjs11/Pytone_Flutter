import 'package:flutter/material.dart';
import 'package:local_now_app/seoul/seoul.dart';
import 'package:local_now_app/survey/first_page.dart';
import 'package:local_now_app/widgets/custom_app_bar.dart';
import 'package:local_now_app/widgets/custom_style.dart';
import 'package:lottie/lottie.dart';

import 'SidoPred/pred80.dart';

// Create on 2023-02-22
// author: Sangwon Kim
// Description: 메인 홈 화면

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    )),
                child: Container(
                  width: double.infinity,
                  height: deviceHeight / 4.3,
                  decoration: CustomStyle().primaryBoxStyle(
                      Colors.deepOrange[300]!.withOpacity(0.8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: deviceHeight / 6,
                        child: Lottie.asset(
                          "assets/train-buildings.json",
                        ),
                      ),
                      Text(
                        '지역 계획 해보기',
                        style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pred80(),
                    )),
                child: Container(
                  width: double.infinity,
                  height: deviceHeight / 4.3,
                  decoration: CustomStyle()
                      .primaryBoxStyle(Colors.purple[300]!.withOpacity(0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: deviceHeight / 6,
                        child: Lottie.asset(
                          "assets/world-map.json",
                        ),
                      ),
                      Text(
                        '전국의 지역별 추이',
                        style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Seoul(),
                    )),
                child: Container(
                  width: double.infinity,
                  height: deviceHeight / 4.3,
                  decoration: CustomStyle()
                      .primaryBoxStyle(Colors.teal[200]?.withOpacity(0.8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: deviceHeight / 6,
                        child: Lottie.network("https://assets1.lottiefiles.com/private_files/lf30_MK1ZRw.json"),
                        // child: Lottie.asset(
                        //   "assets/city-skyline-building.json",
                        // ),
                      ),
                      Text(
                        '서울의 지역별 추이',
                        style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
