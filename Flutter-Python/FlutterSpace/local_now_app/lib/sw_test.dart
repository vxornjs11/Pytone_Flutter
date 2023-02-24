import 'package:flutter/material.dart';

class SwTest extends StatelessWidget {
  const SwTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('test'),
          bottom: TabBar(
            tabs: [
              Text('1'),
              Text('2'),
              Text('3')
            ],
          ),
        ),
      ),
    );
  }
}
