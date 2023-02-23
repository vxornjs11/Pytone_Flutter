import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("랭킹"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("전체랭킹"),
            ),
          ],
        ),
      ),
    );
  }
}
