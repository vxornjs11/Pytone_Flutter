import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/newsScrapy/browser.dart';

class newsMain extends StatelessWidget {
  const newsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

late String link = "";
List newslist = [];

// Map<String, dynamic> mapTest = {};
Map mapTest = {};
String reg = '[^a-zA-Z0-9가-힣\\s]';

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '스크랩파이 테스트',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // onPressed: getJSONData(),
                      onPressed: () => getJSONData('강원'),
                      child: const Text(
                        '강원도 뉴스',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // onPressed: getJSONData(),
                      onPressed: () => getJSONData('충청'),
                      child: const Text(
                        '충청도  뉴스',
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   // onPressed: getJSONData(),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => Notice_main(),
                  //       ),
                  //     );
                  //   },
                  //   child: const Text(
                  //     'webview test',
                  //   ),
                  // ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: newslist.length,
                itemBuilder: (context, position) {
                  return Column(
                    children: [
                      GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (newslist[position].keys)
                                  .toString()
                                  .replaceAll(RegExp(reg), ""),
                            ),
                          ),
                          onTap: () {
                            print(
                                "*******************************************");
                            // print(newslist[position].values);
                            print(newslist[1].values);
                            String link = (newslist[position].values)
                                .toString()
                                .replaceAll(
                                    RegExp('[^a-zA-Z0-9가-힣.=/?:\\s]'), "")
                                .substring(7);
//http://www.ccnnews.co.kr/news/articleView.html?idxno=286073
//http://www.ccnnews.co.kr/news/articleView.html?idxno=286073
                            print("!! In onTap link = ${link}");
                            // checklistFor();
                            ClickedNotice(link);
                          }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// -- FUnction
  // 2022-12-24 Hosik

  getJSONData(str) async {
    switch (str) {
      case '강원':
        str = 'newsGwangWon';
        break;
      case '충청':
        str = 'newsChungChung';
        break;
      default:
        break;
    }
    var url = Uri.parse('http://localhost:5001/${str}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      newslist = dataConvertedJSON['result'];
    });
    // _showDialog(context, newslist);

    int i = 0;
    while (i < newslist.length) {
      mapTest.addAll(newslist[i]);
      i++;
    }
  } //>> getJSONData(str) async { END

  checklistFor() {
    int i = 0;
    while (i < newslist.length) {
      print(newslist[i].values);
      i++;
    }
  }

  ClickedNotice(link) {
    // notice 클릭시 웹뷰

    // >>>>> Click 시 PageRoute로 나오기
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => browser(name: link),
      ),
    );

    // >> Click시 Dialog로 보이기
    // showDialog(
    //   context: context,
    //   barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       content: SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height * 0.7,
    //         child: Notice_main(name: link), //link),
    //       ),
    //     );
    //   },
    // );
  } // >> ClickedNotice(link) END

} // END
