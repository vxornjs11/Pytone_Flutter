import 'package:flutter/material.dart';

class CustomButtonStyle{
  ButtonStyle primary = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 24)),
    minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
    // elevation: MaterialStatePropertyAll(10)
    overlayColor: const MaterialStatePropertyAll(Colors.blueAccent),
  );
}