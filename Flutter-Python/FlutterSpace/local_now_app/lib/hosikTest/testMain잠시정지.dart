// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class hosikTestMain extends StatefulWidget {
//   const hosikTestMain({super.key});

//   @override
//   State<hosikTestMain> createState() => _hosikTestMainState();
// }

// class _hosikTestMainState extends State<hosikTestMain> {
//   @override
//   Widget build(BuildContext context) {
//     final med = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'testets',
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Image.network(
//                   'https://github.com/LeeHosik/Image/blob/main/map.jpeg?raw=true',
//                 ),
//                 Positioned(
//                   top: (med.height) * 0.14,
//                   left: med.width * 0.28,
//                   child: SizedBox(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         //
//                       },
//                       child: const Text(
//                         '수도권',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: (med.height) * 0.4,
//                   left: med.width * 0.26,
//                   child: SizedBox(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         //
//                       },
//                       child: const Text(
//                         '전라도',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: (med.height) * 0.36,
//                   left: med.width * 0.6,
//                   child: SizedBox(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         //
//                       },
//                       child: const Text(
//                         '경상도',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: (med.height) * 0.13,
//                   left: med.width * 0.6,
//                   child: SizedBox(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         //
//                       },
//                       child: const Text(
//                         '강원도',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: (med.height) * 0.26,
//                   left: med.width * 0.34,
//                   child: SizedBox(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         //
//                       },
//                       child: const Text(
//                         '충청도',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //
 
// //