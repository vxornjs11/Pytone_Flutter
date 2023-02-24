import 'package:flutter/material.dart';
import 'package:local_now_app/models/message_answers.dart';
import 'package:local_now_app/survey/survey_Estudent_page.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ObstetricsPage extends StatefulWidget {
  const ObstetricsPage({super.key});

  @override
  State<ObstetricsPage> createState() => _ObstetricsPageState();
}

class _ObstetricsPageState extends State<ObstetricsPage> {
  _ObstetricsPageState();

  double _value3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("산부인과 의원수는"),
        ),
        body: Column(
          children: [
            const Text('산부인과 의원수는?'),
            Lottie.asset('images/hospital.zip'),
            //LottieImageAsset(width: 0, height: 0, i

            SfSlider(
              min: -100,
              max: 100,
              value: _value3,
              showDividers: true,
              interval: 25,
              showLabels: true,
              showTicks: true,
              stepSize: 25,
              onChangeStart: (dynamic startValue) {
                print('Interaction started');
              },
              onChanged: (dynamic newValue) {
                _value3 = newValue;
                setState(() {});
              },
              // onChangeEnd: (dynamic endValue) {
              //   MessageSido.sliderPop = endValue;
              // },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // 값 저장하고 결과 페이지로
                MessageAnswers.sliderDoctor = _value3;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    //생성자로 값을 넣어주는 부분! *******************
                    //메모리에 안 올라감 -> 보안이 굿
                    //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                    return EstudentPage();
                  },
                ));
              },
              child: Text('다음 질문!!'),
            ),
          ],
        ));
  }
}
