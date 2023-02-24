import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/message_seoul.dart';

class SeoulAllChart extends StatefulWidget {
  // final String resultList;
  const SeoulAllChart({super.key});

  @override
  State<SeoulAllChart> createState() => _SeoulAllChartState();
}

class _SeoulAllChartState extends State<SeoulAllChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  //
  late final Map<String, dynamic> resultMap; // 가져온 해당 군구 데이터
  late final List gunguList;
  late bool onLoad = false;

  @override
  void initState() {
    // implement initState
    super.initState();
    resultMap = MessageSeoul.resultMap;
    gunguList = resultMap['군구'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("서울시 군구별 년도별 차트"),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.00,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Theme.of(context).primaryColorLight),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      "서울시 군구별 년도별 차트",
                      // widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 12,
                    top: 36,
                    bottom: 20,
                  ),
                  child: LineChart(mainData(resultMap)),
                  // child: LineChart(
                  //   showAvg
                  //       ? avgData(widget.chartData) // 유저 평균
                  //       : mainData(widget.chartData), // 유저 날짜별 위험도 기록
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------------------
  LineChartData mainData(Map chartData) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 0.1, // 가로축 간격 표시
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 0.5,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 0.1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 38,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      // X축 min, max
      minX: 0,
      maxX: 8,
      // Y축 min, max
      minY: -0.2,
      maxY: 1.2,
      lineBarsData: [
        for (int j = 0; j < gunguList.length; j++)
          LineChartBarData(
            // ******* (x,y)의 좌표 설정하기 *******
            spots: [
              // FlSpot(1, chartData[0]),
              for (int i = 0; i < chartData[gunguList.first].length; i++) ...[
                FlSpot(i.toDouble(), chartData[gunguList[j]][i])
              ],
            ],
            // isCurved: true, // 커브주기
            // gradient: LinearGradient(colors: gradientColors),
            // barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ), // 점 보여주기
            // belowBarData: BarAreaData(
            //   show: true,
            //   gradient: LinearGradient(
            //     colors: gradientColors
            //         .map((color) => color.withOpacity(0.2)) // 그래프 아래 투명도
            //         .toList(),
            //   ),
            // ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------
  // Date: 2023-01-12, SangwonKim
  // Desc: Y축 요소 설정하기 ->
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    // switch (value.toString()) {
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '10';
        break;
      case 20:
        text = '20';
        break;
      case 30:
        text = '30';
        break;
      case 40:
        text = '40';
        break;
      case 50:
        text = '50';
        break;
      case 60:
        text = '60';
        break;
      case 70:
        text = '70';
        break;
      case 80:
        text = '80';
        break;
      case 90:
        text = '90';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  // -----------------------------------------------------------
  // Date: 2023-01-12, SangwonKim
  // Desc: 하단 텍스트
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: -1,
    );
    // 위젯 텍스트 선언
    Widget text = const Text('');

    // Date: 2023-01-13, SangwonKim
    // Desc: 년도 가져오기
    for (int i = 0; i < MessageSeoul.resultMap['년도'].length; i++) {
      if (value.toInt() == i) {
        text = Text(
          // orderby date로 가져올때 사용 ***
          MessageSeoul.resultMap['년도'][i].toString(),

          style: style,
        );
      }
    }

    // --- 기존 방식 ---
    // switch (value.toInt()) {
    //   case 2:
    //     text = const Text('22.12.12', style: style);
    //     break;
    //   case 5:
    //     text = const Text('JUN', style: style);
    //     break;
    //   case 8:
    //     text = const Text('SEP', style: style);
    //     break;
    //   default:
    //     text = const Text('', style: style);
    //     break;
    // }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
} // End
