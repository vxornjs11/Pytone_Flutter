import 'package:flutter/material.dart';

// Create on 2023-02-23
// author: Sangwon Kim
// Description: 스타일 클래스: 버튼스타일, 박스스타일, 텍스트스타일

class CustomStyle {

  primaryButtonStyle() {
    return ButtonStyle(
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      textStyle: const MaterialStatePropertyAll(
          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      minimumSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
      elevation: const MaterialStatePropertyAll(2),
      overlayColor: const MaterialStatePropertyAll(Colors.teal),
    );
  }

  primaryTextStyle(Color? color) {
    return TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  primaryBoxStyle(Color? color) {
    return BoxDecoration(
      color: color,
      // color: Theme.of(context).primaryColorLight.withOpacity(0.7),
      // border: Border.all(width: 1),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
        ),
      ],
    );
  }

}
