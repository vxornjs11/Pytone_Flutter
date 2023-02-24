import 'package:flutter/material.dart';
import 'package:local_now_app/home.dart';
import 'package:local_now_app/seoul/seoul.dart';

class TestNavBar2 extends StatefulWidget {
  const TestNavBar2({super.key});

  @override
  State<TestNavBar2> createState() => _TestNavBar2State();
}

class _TestNavBar2State extends State<TestNavBar2>
    with TickerProviderStateMixin<TestNavBar2> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Teal', Icons.home, Colors.teal, Home()),
    Destination(1, 'Cyan', Icons.business, Colors.cyan, Seoul()),
    Destination(2, 'Orange', Icons.school, Colors.orange, Seoul()),
    Destination(3, 'Blue', Icons.flight, Colors.blue, Seoul()),
  ];

  late final List<GlobalKey<NavigatorState>> navigatorKeys;
  late final List<GlobalKey> destinationKeys;
  late final List<AnimationController> destinationFaders;
  late final List<Widget> destinationViews;
  int selectedIndex = 0;

  AnimationController buildFaderController() {
    final AnimationController controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {}); // Rebuild unselected destinations offstage.
      }
    });
    return controller;
  }

  @override
  void initState() {
    super.initState();
    navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    destinationFaders = List<AnimationController>.generate(
        allDestinations.length, (int index) => buildFaderController()).toList();
    destinationFaders[selectedIndex].value = 1.0;
    destinationViews = allDestinations.map((Destination destination) {
      return FadeTransition(
          opacity: destinationFaders[destination.index]
              .drive(CurveTween(curve: Curves.fastOutSlowIn)),
          child: DestinationView(
            destination: destination,
            navigatorKey: navigatorKeys[destination.index],
          ));
    }).toList();
  }

  @override
  void dispose() {
    for (final AnimationController controller in destinationFaders) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator =
            navigatorKeys[selectedIndex].currentState!;
        if (!navigator.canPop()) {
          return true;
        }
        navigator.pop();
        return false;
      },
      child: Scaffold(
        //   body: [
        //   const Home(),
        //   const Seoul(),
        //   const Home(),
        // ][selectedIndex],
        // body: SafeArea(
        //   top: false,
        //   child: Stack(
        //     fit: StackFit.expand,
        //     children: [
        //       [
        //         const Home(),
        //         const Seoul(),
        //         const Home(),
        //       ][selectedIndex]
        //     ],
        //   ),
        // ),
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: allDestinations.map((Destination destination) {
              final int index = destination.index;
              final Widget view = destinationViews[index];
              if (index == selectedIndex) {
                destinationFaders[index].forward();
                return Offstage(offstage: false, child: view);
              } else {
                // destinationFaders[index].reverse();
                destination.page;
                if (destinationFaders[index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: destination.page);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: allDestinations.map((Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              label: destination.title,
            );
          }).toList(),
          height: 44,
          backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.5),
        ),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color, this.page);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Widget page;
}

class DestinationView extends StatefulWidget {
  const DestinationView({
    super.key,
    required this.destination,
    required this.navigatorKey,
  });

  final Destination destination;
  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return Home();
              // case '/list':
              //   return Seoul();
              // case '/text':
              //   return Home();
            }
            assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }
}
