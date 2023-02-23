import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      // isShowingMainData ? sampleData1 : sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        // lineTouchData: lineTouchData1,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 0.2,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.5,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.7,
            );
          },
        ),
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 2013,
        maxX: 2020,
        minY: -0.15,
        maxY: 1.03,
      );

  // LineChartData get sampleData2 => LineChartData(
  //       lineTouchData: lineTouchData2,
  //       gridData: gridData,
  //       titlesData: titlesData2,
  //       borderData: borderData,
  //       lineBarsData: lineBarsData2,
  //       minX: 0,
  //       maxX: ChartData.x2,
  //       maxY: 6,
  //       minY: 0,
  //     );

  // LineTouchData get lineTouchData1 => LineTouchData(
  //       handleBuiltInTouches: true,
  //       touchTooltipData: LineTouchTooltipData(
  //         tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
  //       ),
  //     );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  // List<LineChartBarData> get lineBarsData2 => [
  //       // lineChartBarData2_1,
  //       // lineChartBarData2_2,
  //       // lineChartBarData2_3,
  //     ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toString()) {
      // y축 라벨
      case '-0.1':
        text = '-0.1';
        break;
      case '1.03':
        text = '1.03';
        break;
      // case '0.9':
      //   // print(value);
      //   text = '0.9';
      //   break;
      // case 1.5:
      //   text = '1';
      //   break;
      // default:
      // return Container();
      default:
        text = "";
    }

    return Text(text, textAlign: TextAlign.center);
  }

  // 왼쪽 타이틀
  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  // x축
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      // x축 라벨
      case 2013:
        text = const Text('2013');
        break;
      case 2014:
        text = const Text('2014');
        break;
      case 2015:
        text = const Text('2015');
        break;
      case 2016:
        text = const Text('2016');
        break;
      case 2017:
        text = const Text('2017');
        break;
      case 2018:
        text = const Text('2018');
        break;
      case 2019:
        text = const Text('2019');
        break;
      case 2020:
        text = const Text('2020');
        break;
      // case 2124:
      //   text = const Text('2124', style: style);
      //   break;
      // case 2174:
      //   text = const Text('2174', style: style);
      //   break;
      // case 2224:
      //   text = const Text('2224', style: style);
      //   break;
      // case 2274:
      //   text = const Text('2274', style: style);
      //   break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          // 테두리
          bottom:
              // BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
              BorderSide(color: Colors.black, width: 1.5),
          left: BorderSide(color: Colors.black, width: 1.5),
          // right: BorderSide(color: Colors.black),
          // top: BorderSide(color: Colors.black),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        // color: AppColors.contentColorGreen,
        color: Colors.green,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(2013, 0.9448880358338055),
          FlSpot(2014, 0.9446415720957276),
          FlSpot(2015, 0.944512153595157),
          FlSpot(2016, 0.946351892415281),
          FlSpot(2017, 0.9465979239240231),
          FlSpot(2018, 0.9461801856946769),
          FlSpot(2019, 0.9435139711828607),
          FlSpot(2020, 0.9445218388223376),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        // color: AppColors.contentColorPink,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink,
          // color: AppColors.contentColorPink.withOpacity(0),
        ),
        spots: [
          FlSpot(2013, 0.770495610097448),
          FlSpot(2014, 0.7711475361616995),
          FlSpot(2015, 0.771750958471076),
          FlSpot(2016, 0.7777107621718886),
          FlSpot(2017, 0.7760899803272783),
          FlSpot(2018, 0.774875339919108),
          FlSpot(2019, 0.7699760665380511),
          FlSpot(2020, 0.7719496051871584),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        // color: AppColors.contentColorCyan,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(2013, -0.011202178530094864),
          FlSpot(2014, -0.018089907242234027),
          FlSpot(2015, -0.010003226201636961),
          FlSpot(2016, -0.017038323203343975),
          FlSpot(2017, -0.02073680848158066),
          FlSpot(2018, -0.026382426158082284),
          FlSpot(2019, -0.05601976686366972),
          FlSpot(2020, -0.11372637713352218),
        ],
      );

  // LineChartBarData get lineChartBarData2_1 => LineChartBarData(
  //       isCurved: true,
  //       curveSmoothness: 0,
  //       // color: AppColors.contentColorGreen.withOpacity(0.5),
  //       color: Colors.green.withOpacity(0.5),
  //       barWidth: 4,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: false),
  //       spots: const [
  //         FlSpot(1, 1),
  //         FlSpot(3, 4),
  //         FlSpot(5, 1.8),
  //         FlSpot(7, 5),
  //         FlSpot(10, 2),
  //         FlSpot(12, 2.2),
  //         FlSpot(13, 1.8),
  //       ],
  //     );

//   LineChartBarData get lineChartBarData2_2 => LineChartBarData(
//         isCurved: true,
//         // color: AppColors.contentColorPink.withOpacity(0.5),
//         color: Colors.pink.withOpacity(0.5),
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: true,
//           color: Colors.pink.withOpacity(0.2),
//         ),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 2.8),
//           FlSpot(7, 1.2),
//           FlSpot(10, 2.8),
//           FlSpot(12, 2.6),
//           FlSpot(13, 3.9),
//         ],
//       );

//   LineChartBarData get lineChartBarData2_3 => LineChartBarData(
//         isCurved: true,
//         curveSmoothness: 0,
//         color: Colors.cyan.withOpacity(0.5),
//         // color: AppColors.contentColorCyan.withOpacity(0.5),
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: FlDotData(show: true),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 3.8),
//           FlSpot(3, 1.9),
//           FlSpot(6, 5),
//           FlSpot(10, 3.3),
//           FlSpot(13, 4.5),
//         ],
//       );
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample2State();
}

class LineChartSample2State extends State<LineChartSample2> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 37),
              // const Text(
              //   'Monthly Sales',
              //   style: TextStyle(
              //     color: Colors.yellow,
              //     // color: AppColors.primary,
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 2,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 37),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 6),
                  child: _LineChart(isShowingMainData: isShowingMainData),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.refresh,
          //     color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       isShowingMainData = !isShowingMainData;
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
