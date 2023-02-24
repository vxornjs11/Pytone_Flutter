import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_now_app/hosikTest/map_gra.dart';
// import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:local_now_app/hosikTest/onPress.dart';
import 'package:local_now_app/hosikTest/onclicked.dart';
import '../models/hosikModel.dart';

class hosikTestMain extends StatefulWidget {
  const hosikTestMain({super.key});

  @override
  State<hosikTestMain> createState() => _hosikTestMainState();
}

class _hosikTestMainState extends State<hosikTestMain> {
  late int year;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = 2020;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context).size;
    final List<String> hangjungGuYuk = [
      '수도권',
      '강원도',
      '충청도',
      '경상도',
      '전라도',
      '제주도'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'testets',
        ),
      ),
      body: hangjungGuYuk.isEmpty
          ? Image.network(
              'https://i.pinimg.com/originals/fa/6a/a8/fa6aa8b9f02691e42df56f1678e795fc.gif')
          : SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${year.toString()} 년',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'data222',
                          ),
                        ],
                      ),
                    ),
                    Stack(),
                    // Positioned(
                    //   // top: med.height * 0.5,
                    //   left: med.width * 0.5,
                    Center(
                      child:
                          //  Row(
                          //   // mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          SizedBox(
                        width: med.width * 0.6,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: hangjungGuYuk.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
                          ),
                          itemBuilder: (context, index) {
                            // Hosik.localAreaIndex = index;
                            return cardBuild(context, index, hangjungGuYuk);
                          },
                        ),
                        //   ),
                        // ],
                      ),
                    ),
                    Container(
                      // child: AreaClicked(context),
                      child: AreaClicked(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
} // END
