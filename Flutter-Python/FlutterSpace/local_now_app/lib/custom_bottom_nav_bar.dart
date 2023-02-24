import 'package:flutter/material.dart';
import 'package:local_now_app/home.dart';

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

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.business, color: Colors.teal,),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.cyan,),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.list, color: Colors.blue,),
            label: '',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        // animationDuration: const Duration(seconds: 2),
        height: 44,
        backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.4),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
      body: <Widget>[
        const Home(),
        const Home(),
        const Home(),
      ][currentPageIndex],
    );
  }
}
