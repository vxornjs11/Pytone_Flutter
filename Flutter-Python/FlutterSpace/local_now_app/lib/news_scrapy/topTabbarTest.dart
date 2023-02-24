import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "전화"),
              Tab(text: "주소록"),
              Tab(text: "기록"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.call),
            Icon(Icons.account_box),
            Icon(Icons.assignment_outlined),
          ],
        ),
      ),
    ));
  }
}
