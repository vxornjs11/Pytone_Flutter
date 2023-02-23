import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:local_now_app/Model/message_sido.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatefulWidget {
  const Gauge({super.key});

  @override
  State<Gauge> createState() => _GaugeState();
}

class _GaugeState extends State<Gauge> {
  double width = 30;
  late Map<String, dynamic> result;

  @override
  void initState() {
    super.initState();
    get80Value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              minimum: -0.5,
              maximum: 1.5,
              startAngle: 180,
              endAngle: 0,
              tickOffset: 25,
              pointers: <GaugePointer>[
                const NeedlePointer(
                  value: 0.8,
                ),
                //// 이미지 포인터
                // MarkerPointer(
                //   value: 0.7,
                //   markerType: MarkerType.image,
                //   markerHeight: 35,
                //   markerWidth: 25,
                //   imageUrl: 'images/marker2.png',
                // )
                // 80년 뒤 소멸 위험도
                MarkerPointer(
                  value: MessageSido.value80,
                  markerHeight: 20,
                  markerWidth: 20,
                  elevation: 4,
                )
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: -0.5,
                  endValue: 0.33,
                  color: Colors.green,
                  startWidth: width,
                  endWidth: width,
                ),
                GaugeRange(
                  startValue: 0.33,
                  endValue: 0.67,
                  color: Colors.orange,
                  startWidth: width,
                  endWidth: width,
                ),
                GaugeRange(
                  startValue: 0.67,
                  endValue: 1.5,
                  color: Colors.red,
                  startWidth: width,
                  endWidth: width,
                )
              ],
            )
          ])
        ],
      ),
    );
  }

  // 이대로 변하지 않으면 80년 뒤에 예측되는 값
  get80Value() async {
    var url = Uri.parse('http://localhost:5000/gang?year=2103');
    var response = await http.get(url);
    // print(response.body);
    // setState(() {
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];
    // });

    // 받아온 값 넣기
    MessageSido.value80 = result['pre'];
    print(MessageSido.value80);
    setState(() {});
  }
}
