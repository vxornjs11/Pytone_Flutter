import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _counter =
      ValueNotifier<int>(0); // ValueNotifier 변수 선언
  final Widget goodJob = const Text('Good job!');

  int _count = 0;

  void setCount(int counter) {
    setState(() {
      _count = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder(
              valueListenable: _counter, // 사용할 변수를 지정. _counter가 변경 되면 자동 호출
              builder: (BuildContext context, int value, Widget? child) {
                // setState() 가 있는 함수를 호출
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setCount(value);
                });

                // value = _counter 로 적용
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('$value'),
                    child!, // child는 아래 지정된 위젯으로 치환됨
                  ],
                );
              },
              child: goodJob,
            ),
            Container(child: Text('$_count')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1, // _counter.value 값이 수정되면 자동 호출
      ),
    );
  }
}
