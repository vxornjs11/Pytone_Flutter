import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alertclass {
  Alert(BuildContext context) {
    // setState(() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '경고!',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: 200,
              child: Row(
                children: const [
                  // Icon(Icons.),
                  Text('이미 존재하는 아이디 입니다. \n'
                      '다른 아이디를 입력 해주세요.'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('나가기'),
              ),
            ],
          );
        });
    // });
  }
}
