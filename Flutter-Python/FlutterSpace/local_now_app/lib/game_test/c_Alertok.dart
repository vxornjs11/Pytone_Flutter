import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_style.dart';

class AlertOK {
  Alertokay(BuildContext context) {
    CustomStyle textcolor = CustomStyle();
    // setState(() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              '축하합니다!',
              style: textcolor.secondaryTextStyle(Colors.teal[900]),
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
