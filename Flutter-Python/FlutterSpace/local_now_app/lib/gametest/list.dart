// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class List extends StatefulWidget {
//   const List({super.key});

//  ===== 박태권의 랭킹 시스템 개발 여부에 따라서 사라질지도 모름 =====

//   @override
//   State<List> createState() => _ListState();
// }

// class _ListState extends State<List> {
//   late List todoList;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     todoList = [] as List;
//     // List<String> todoList = List();
//     // todoList = ["korea", "Japen", "US"] as List;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ListView.builder(
//             itemCount: todoList.length,
//             // 전체 몇개냐 if for colection function
//             itemBuilder: (context, position) {
//               // position = index 번호 length에 맞춰서 자동으로 for문 돌아.
//               return GestureDetector(
//                 onTap: () {
//                   Message.workList = todoList[position].workList;
//                   Message.imagePath = todoList[position].imagePath;
//                   //스테틱으로 넣어줄거 보내기
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const DetailList(),
//                       ));
//                 },
//                 child: Card(
//                   color: position % 2 == 0
//                       ? Colors.redAccent.shade100
//                       : Colors.blueAccent.shade100,
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(
//                           todoList[position].imagePath,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Text(
//                         "    ${todoList[position].workList} ",
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
