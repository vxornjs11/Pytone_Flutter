import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_style.dart';

class Alertclass {
  Alert(BuildContext context) {
    CustomStyle textcolor = CustomStyle();
    // setState(() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              '경고!',
              style: textcolor.secondaryTextStyle(Colors.teal[900]),
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
