import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'easygame.dart';

class gamePage extends StatefulWidget {
  const gamePage({super.key});

  @override
  State<gamePage> createState() => _gamePageState();
}

class _gamePageState extends State<gamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상식 퀴즈!!"),
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
                    builder: (context) => easygame(),
                  ),
                );
              },
              child: const Text("Easy"),
            ),
          ],
        ),
      ),
    );
  }
}
