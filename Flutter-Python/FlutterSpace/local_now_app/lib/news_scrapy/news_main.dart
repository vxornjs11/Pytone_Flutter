import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_now_app/news_scrapy/browser.dart';

class NewsMain extends StatelessWidget {
  const NewsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

late TextEditingController serachTextFeild;
late bool isLoading;
late int iindex;
late bool isChungcung;
List newslist = [];
List viewList = [];
String imgNetworkAdress =
    'https://thumbs.dreamstime.com/z/news-text-13328820.jpg';

String reg = '[^a-zA-Z0-9가-힣\\s]';

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // implement initState
    super.initState();
    isLoading = false; // for indicator
    isChungcung = false;
    iindex = 1;
    serachTextFeild = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: iindex,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.0),
            child: AppBar(
              bottom: TabBar(
                tabs: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChungcung = true;
                        iindex = 0;
                        imgNetworkAdress =
                            'http://www.ccnnews.co.kr/image/logo/toplogo_20190220095446.png';
                        isLoading = true;
                      });
                      viewList = [];
                      getJSONData('충청');
                    },
                    child: const Tab(
                      child: Text('충청도 뉴스'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChungcung = false;
                        iindex = 1;
                        imgNetworkAdress =
                            'http://m.kwnews.co.kr/assets/images/common/logo.png';
                        isLoading = true;
                      });
                      viewList = [];
                      getJSONData('강원');
                    },
                    child: Tab(
                      child: Text('강원도 뉴스'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body:
              //  Column(
              //    mainAxisAlignment: MainAxisAlignment.start,
              //    children: [
              // TabBarView(
              isLoading
                  ? Center(
                      child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: SizedBox(
                              child: Image.network(imgNetworkAdress),
                            ),
                          ),
                          // 충청도 뉴스시에는 검색가능함
                          isChungcung
                              ? SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextField(
                                          controller: serachTextFeild,
                                          // decoration: const InputDecoration(
                                          //   hintText: '비밀번호를 입력하세요.',
                                          //   enabledBorder: UnderlineInputBorder(
                                          //     borderSide: BorderSide(
                                          //         color: Color.fromARGB(
                                          //             255, 176, 162, 39)),
                                          //   ),
                                          //   focusedBorder: UnderlineInputBorder(
                                          //     borderSide: BorderSide(
                                          //         color: Color.fromARGB(
                                          //             255, 176, 162, 39)),
                                          //   ),
                                          // ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          viewList = [];
                                          getSearchJSONData(
                                              serachTextFeild.text);
                                        },
                                        child: const Text(
                                          'Search!',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
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
                                          .replaceAll(
                                              RegExp('[^a-zA-Z0-9가-힣.=/?:\\s]'),
                                              "")
                                          .substring(7);
                                      ClickedNotice(link);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          // SizedBox(
                          //   child: Text('test'),
                          // )
                        ],
                      ),
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
    var url = Uri.parse('http://127.0.0.1:5000/${str}');
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

// 충청도 검색
  getSearchJSONData(str) async {
    var url = Uri.parse('http://127.0.0.1:5000/search?search=${str}');
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

//

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
