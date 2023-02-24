import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/seoul/seoul_chart.dart';
import 'package:local_now_app/widgets/custom_buttons.dart';
import 'package:lottie/lottie.dart';

import '../models/message_seoul.dart';
import '../widgets/custom_loader.dart';

// Create on 2023-02-21
// author: Sangwon Kim
// Description: 서울 군구별 안내 페이지

class Seoul extends StatefulWidget {
  const Seoul({super.key});

  @override
  State<Seoul> createState() => _SeoulState();
}

class _SeoulState extends State<Seoul> {
  late TextEditingController gunguController;

  // late String imageName;
  late String gungu;
  late Map<String, dynamic> result;
  late bool onLoad = false;
  late int selectedItem; // 피커뷰 번호
  late List imageName;

  @override
  void initState() {
    // implement initState
    super.initState();
    gungu = '종로구';
    gunguController = TextEditingController();
    result = {};
    selectedItem = 0; // 초기값
    imageName = [
      '종로구',
      '중구',
      '용산구',
      '성동구',
      '광진구',
      '동대문구',
      '중랑구',
      '성북구',
      '강북구',
      '도봉구',
      '노원구',
      '은평구',
      '서대문구',
      '마포구',
      '양천구',
      '강서구',
      '구로구',
      '금천구',
      '영등포구',
      '동작구',
      '관악구',
      '서초구',
      '강남구',
      '송파구',
      '강동구'
    ];
    // imageName = [
    //   "Jongno_gu",
    //   "Jung_gu",
    //   "Yongsan_gu",
    //   "Seongdong_gu",
    //   "Gwangjin_gu",
    //   "Dongdaemun_gu",
    //   "Jungnang_gu",
    //   "Seongbuk_gu",
    //   "Gangbuk_gu",
    //   "Dobong_gu",
    //   'Nowon_gu',
    //   'Eunpyeong_gu',
    //   'Seodaemun_gu',
    //   'Mapo_gu',
    //   'Yangcheon_gu',
    //   'Gangseo_gu',
    //   'Guro_gu',
    //   'Geumcheon_gu',
    //   "Yeongdeungpo_gu",
    //   "Dongjak_gu",
    //   "Gwanak_gu",
    //   "Seocho_gu",
    //   "Gangnam_gu",
    //   "Songpa_gu",
    //   "Gangdong_gu"
    // ];
    // CustomButtonStyle customButtonStyle = CustomButtonStyle();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seoul 군구별 차트'),
          elevation: 0.1,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 피커뷰로 바꿔주기
                  // 왼쪽에는 구별 이미지 바뀌는거 보여주기
                  // TextField(
                  //     controller: gunguController,
                  //     decoration: const InputDecoration(labelText: '군구'),
                  //     keyboardType: TextInputType.text // 소수점찍기<<
                  //     // keyboardType: const TextInputType.numberWithOptions(decimal: true) // 소수점찍기<<
                  //     ),

                  // CircleAvatar(
                  //   backgroundImage: AssetImage('images/$result.jpg'),
                  //   radius: 100,
                  // ),
                  //// ---------
                  Lottie.asset("assets/city-skyline.json"),
                  // Lottie.network("https://assets1.lottiefiles.com/packages/lf20_aEtcq1Z1up.json"),
                  // const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/seoul/${imageName[selectedItem]}.jpeg',
                          // 'images/seoul/종로구.jpeg',
                          width: deviceWidth / 2.3,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        width: deviceWidth / 2.3,
                        height: 200,
                        child: CupertinoPicker(
                          // backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.5),
                          // key: UniqueKey(),
                          itemExtent: 30,
                          // scrollController:
                          // FixedExtentScrollController(initialItem: 1),
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          onSelectedItemChanged: (value) {
                            setState(() {
                              selectedItem = value;
                            });
                          },
                          children: [
                            for (int i = 0; i < imageName.length; i++) ...[
                              Text(imageName[i])
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Text('Selected Item: ${imageName[selectedItem]}'),

                  ElevatedButton(
                    style: CustomButtonStyle().primary,
                    // style: ElevatedButton.styleFrom(
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    //   textStyle: const TextStyle(fontSize: 20),
                    //   minimumSize: Size(double.infinity, 50)
                    // ),
                    onPressed: () async {
                      //
                      gungu = imageName[selectedItem];
                      // gungu = gunguController.text;
                      //
                      await getJSONData();
                      MessageSeoul.gungu = gungu;
                      MessageSeoul.resultMap = result;
                      // Loader 3초 후 다음 단계 실행
                      onLoad = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        onLoad = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeoulChart(),
                            ));
                        _showDialog(context, result);
                      });
                    },
                    child: const Text('OK'),
                  ),

                  //// ---------
                ],
              ),
            ),
            CustomLoader(onLoad: onLoad)
            // Center(
            //     child: onLoad
            //         ? SizedBox(
            //             width: 200,
            //             child: Lottie.network(
            //                 'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'),
            //             // 'https://assets7.lottiefiles.com/packages/lf20_c5vj9laj.json'),
            //           )
            //         : const SizedBox()),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  getJSONData() async {
    var url = Uri.parse('http://127.0.0.1:5000/gungu?gungu=$gungu');

    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    // _showDialog(context, result);
  }

  _showDialog(BuildContext context, Map result) {
    // _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('위험도 예측 결과'),
          // content: Text(result['pred_cluster'].toString()),
          content: Text(
              "입력하신 년도는 \n${result['년도']} 입니다.\n\n입력하신 결과는 \n${result['pred_cluster']} 입니다."),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  //
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
} // End
