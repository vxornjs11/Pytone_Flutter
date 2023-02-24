import 'package:flutter/material.dart';

@override
Widget clickedLocal(BuildContext context, String AreaName) {
  return Scaffold(
    body: Column(
      children: [
        Text(AreaName),
      ],
    ),
  );
}
