// return DefaultTabController(
//       length: 2,
//       animationDuration: const Duration(seconds: 1),
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(55.0),
//           child: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       imgNetworkAdress =
//                           'http://www.ccnnews.co.kr/image/logo/toplogo_20190220095446.png';
//                       isLoading = true;
//                     });
//                     viewList = [];
//                     getJSONData('충청');
//                   },
//                   child: const Tab(
//                     child: Text(
//                       '충청도 뉴스',
//                       style: TextStyle(
//                         fontSize: 16,
//                         // fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       imgNetworkAdress =
//                           'http://m.kwnews.co.kr/assets/images/common/logo.png';
//                       isLoading = true;
//                     });
//                     viewList = [];
//                     getJSONData('강원');
//                   },
//                   child: const Tab(
//                     child: Text(
//                       '강원도 뉴스',
//                       style: TextStyle(
//                         fontSize: 16,
//                         // fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),