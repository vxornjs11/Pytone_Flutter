import 'dart:convert';
import 'package:local_now_app/news_scrapy/MapTest.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/news_scrapy/browser.dart';

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

late bool isLoading;
// late String link = "";
List newslist = [];
List viewList = [];
String imgNetworkAdress =
    'https://thumbs.dreamstime.com/z/news-text-13328820.jpg';

// Map<String, dynamic> mapTest = {};
// Map mapTest = {};
String reg = '[^a-zA-Z0-9가-힣\\s]';

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false; // for indicator
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '지방별 뉴스 보기',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // onPressed: getJSONData(),
                      onPressed: () {
                        setState(() {
                          imgNetworkAdress =
                              'http://m.kwnews.co.kr/assets/images/common/logo.png';
                          isLoading = true;
                        });

                        viewList = [];
                        getJSONData('강원');
                      },
                      child: const Text(
                        '강원도 뉴스',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // onPressed: getJSONData(),
                      onPressed: () {
                        isLoading = true;
                        imgNetworkAdress =
                            'http://www.ccnnews.co.kr/image/logo/toplogo_20190220095446.png';
                        setState(() {
                          isLoading = true;
                        });
                        viewList = [];
                        getJSONData('충청');
                      },
                      child: const Text(
                        '충청도 뉴스',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mapTest(),
                          ),
                        );
                      },
                      child: const Text(
                        'test Main',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    // onPressed: getJSONData(),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Notice_main(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'webview test',
                    ),
                  ),
                ],
              ),
            ),
            isLoading
                ? Center(
                    child: Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'), // 타자치는 애
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: SizedBox(
                      child: Image.network(imgNetworkAdress),
                    ),
                  ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: viewList.length,
              itemBuilder: (context, position) {
                return Column(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (viewList[position].keys)
                              .toString()
                              .replaceAll(RegExp(reg), ""),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      onTap: () {
                        String link = (newslist[position].values)
                            .toString()
                            .replaceAll(RegExp('[^a-zA-Z0-9가-힣.=/?:\\s]'), "")
                            .substring(7);
                        ClickedNotice(link);
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              child: Text('test'),
            )
          ],
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
    var url = Uri.parse('http://127.0.0.1:5001/${str}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      newslist = dataConvertedJSON['result'];
    });
    // _showDialog(context, newslist);

    int i = 0;
    // while (i < newslist.length) {
    while (i < 7) {
      // 8번째 뉴스까지만 보이게 할꺼임
      // viewList.append(newslist[i]);
      viewList.add(newslist[i]);
      i++;
    }
    isLoading = false;
  } //>> getJSONData(str) async { END

  ClickedNotice(link) {
    // notice 클릭시 웹뷰

    // >>>>> Click 시 PageRoute로 나오기
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => browser(name: link),
    //   ),
    // );

    // >> Click시 Dialog로 보이기
    showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.9,
            child: browser(name: link), //link),
          ),
        );
      },
    );
  } // >> ClickedNotice(link) END

} // END
