import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.numbers),
            label: '1',
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.numbers),
            label: '2',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        animationDuration: const Duration(seconds: 2),
        height: 60,labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      body: <Widget>[
        // const FirstPage(),
        // const SecondPage(),
        // const ThirdPage(),
      ][currentPageIndex],
    );
  }
}
