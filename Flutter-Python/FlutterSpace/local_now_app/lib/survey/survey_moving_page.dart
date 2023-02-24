import 'package:flutter/material.dart';
import 'package:local_now_app/models/message_answers.dart';
import 'package:local_now_app/survey/survey_baby_page.dart';
import 'package:local_now_app/survey/survey_result.dart';
import 'package:local_now_app/widgets/custom_style.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MovingPage extends StatefulWidget {
  const MovingPage({super.key});

  @override
  State<MovingPage> createState() => _MovingPageState();
}

class _MovingPageState extends State<MovingPage> {
  _MovingPageState();

  double _value1 = MessageAnswers.sliderPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("나만의 지역의 전출인구 수?"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              // const Text('전출인구 수'),
              Lottie.asset('images/moving.zip'),
              //LottieImageAsset(width: 0, height: 0, i

<<<<<<< HEAD
            SfSlider(
              min: 0,
              max: 8,
              value: _value1,
              showDividers: true,
              interval: 1,
              showLabels: true,
              showTicks: true,
              stepSize: 1,
              onChangeStart: (dynamic startValue) {
                print('Interaction started');
              },
              onChanged: (dynamic newValue) {
                _value1 = newValue;
                setState(() {});
              },
              // onChangeEnd: (dynamic endValue) {
              //   MessageSido.sliderPop = endValue;
              // },
            ),
            const Text('(단위 : 250,000명)'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // 값 저장하고 결과 페이지로
                // MessageAnswers.sliderPop = _value1;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    //생성자로 값을 넣어주는 부분! *******************
                    //메모리에 안 올라감 -> 보안이 굿
                    //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                    return ResultPage();
                  },
                ));
              },
              child: Text('다음 질문!!'),
            ),
          ],
=======
              SfSlider(
                min: 0,
                max: 8,
                value: _value1,
                showDividers: true,
                interval: 1,
                showLabels: true,
                showTicks: true,
                stepSize: 1,
                onChangeStart: (dynamic startValue) {
                  print('Interaction started');
                },
                onChanged: (dynamic newValue) {
                  _value1 = newValue;
                  setState(() {});
                },
                // onChangeEnd: (dynamic endValue) {
                //   MessageSido.sliderPop = endValue;
                // },
              ),
              const Text('(단위 : 250,000명)'),
              ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () {
                  // 값 저장하고 결과 페이지로
                  // MessageAnswers.sliderPop = _value1;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      //생성자로 값을 넣어주는 부분! *******************
                      //메모리에 안 올라감 -> 보안이 굿
                      //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                      return const ResultPage();
                    },
                  ));
                },
                child: const Text('다음 질문!'),
              ),
            ],
          ),
>>>>>>> sangwonKim7
        ));
  }
}
