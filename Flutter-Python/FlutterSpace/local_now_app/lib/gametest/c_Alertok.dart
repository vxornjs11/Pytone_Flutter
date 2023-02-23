import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertOK {
  Alertokay(BuildContext context) {
    // setState(() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '축하합니다!',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: 200,
              child: Row(
                children: const [
                  // Icon(Icons.),
                  Text('등록 되었습니다!.'),
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
  }
}
