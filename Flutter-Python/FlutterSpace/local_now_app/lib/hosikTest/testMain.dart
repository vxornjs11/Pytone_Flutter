import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_now_app/hosikTest/onclick.dart';

class hosikTestMain extends StatefulWidget {
  const hosikTestMain({super.key});

  @override
  State<hosikTestMain> createState() => _hosikTestMainState();
}

class _hosikTestMainState extends State<hosikTestMain> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context).size;
    final List<String> hangjungGuYuk = [
      '수도권',
      '강원도',
      '충청도',
      '전라도',
      '경상도',
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'data',
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
                            'data',
                          ),
                        ],
                      ),
                    ),
                    Stack(),
                    Positioned(
                      // top: med.height * 0.3,
                      left: med.width * 0.5,
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
                            return cardBuild(context, index, hangjungGuYuk);
                          },
                        ),
                        //   ),
                        // ],
                      ),
                    ),
                    SizedBox(
                      child: Text('date'),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

Widget cardBuild(BuildContext context, int index, List<String> hangjungGuYuk) {
  final med = MediaQuery.of(context).size;
  return Card(
    child: Stack(
      children: [
        Stack(),
        GestureDetector(
          onTap: () => clickedLocal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: double.infinity,
                // maxWidth: med.width * 0.3,
                maxHeight: double.infinity),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hangjungGuYuk[index],
                    style: TextStyle(
                      height: 1.0,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              //   ],
              // ),
              decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: 150,
                //       spreadRadius: 1,
                //     ),
                //   ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
      
      
//
 
//