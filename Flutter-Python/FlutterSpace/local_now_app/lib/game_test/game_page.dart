import 'package:flutter/material.dart';

import 'easygame.dart';
import 'list.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EasyGame(),
                  ),
                );
              },
              child: const Text("Easy"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Ranking(),
                    ),
                  );
                },
                child: const Text("랭킹 보기."))
          ],
        ),
      ),
    );
  }
}
