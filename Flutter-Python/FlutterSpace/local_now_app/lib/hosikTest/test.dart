// import 'package:flutter/material.dart';

// class MyStatefulWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new MyStatefulWidgetState();

//   //context를 반환하는 함수 'of'를 static으로 생성한다.
//   static MyStatefulWidgetState of(BuildContext context) =>
//       context.findAncestorStateOfType<MyStatefulWidgetState>();
// }

// class MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String _string = "please input text";

//   set string(String value) => setState(() => _string = value);

//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       children: <Widget>[new Text(_string), MyChildClass()],
//     );
//   }
// }

// class MyChildClass extends StatelessWidget {
//   MyChildClass();

//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       children: <Widget>[
//         new RaisedButton(
//           onPressed: () {
//             MyStatefulWidget.of(context).string = "hello world";
//           },
//           child: new Text("Click"),
//         )
//       ],
//     );
//   }
// }
