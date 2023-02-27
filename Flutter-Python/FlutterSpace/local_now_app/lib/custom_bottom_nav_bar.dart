import 'package:flutter/material.dart';
import 'package:local_now_app/game_test/easygame.dart';
import 'package:local_now_app/home.dart';
import 'package:local_now_app/news_scrapy/news_main.dart';

//
// Create on 2023-02-22
// author: Sangwon Kim
// Description: 바텀 네비게이션바
//

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int currentPageIndex;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.library_books,
              color: Colors.teal[500],
            ),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.deepOrange[800],
            ),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.emoji_events,
              color: Colors.indigoAccent,
            ),
            label: 'Quiz',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        // animationDuration: const Duration(seconds: 1),
        height: 46,
        backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.4),
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
      body: <Widget>[
        const NewsMain(),
        const Home(),
        const EasyGame(),
      ][currentPageIndex],
    );
  }
}
