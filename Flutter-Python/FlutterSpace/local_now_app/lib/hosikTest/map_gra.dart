import 'package:flutter/material.dart';
import 'package:local_now_app/hosikTest/onPress.dart';
import 'package:local_now_app/hosikTest/onclicked.dart';
import 'package:local_now_app/hosikTest/testMain.dart';
import 'package:local_now_app/models/hosikModel.dart';

class cardBuild extends StatefulWidget {
  final List<String> hangjungGuYuk;
  final BuildContext context;
  final int index;
  const cardBuild(BuildContext this.context, int this.index,
      List<String> this.hangjungGuYuk,
      {super.key});

  @override
  State<cardBuild> createState() => _cardBuildState();
}

class _cardBuildState extends State<cardBuild> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Stack(),
          GestureDetector(
            onLongPress: () =>
                PDetailLocalArea(context, widget.hangjungGuYuk[widget.index]),
            onTap: () => chgsomeDetail(widget.hangjungGuYuk[widget.index]),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 70,
                  minHeight: 70,
                  maxWidth: double.infinity,
                  maxHeight: double.infinity),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.hangjungGuYuk[widget.index],
                      style: TextStyle(
                        height: 1.0,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
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

// Function
  PDetailLocalArea(context, String areaName) {
    showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(content: clickedLocal(context, areaName));
      },
    );
  } // PDetailLocalArea(context, String areaName) { END

// Function
  chgsomeDetail(String GetAreaName) {
    if (Hosik.localAreaIndex != GetAreaName) {
      Hosik.localAreaIndex = GetAreaName;
    }
    print('clicked chgsomeDetail Function');

    // State<AreaClicked> createState2() => AreaClickedState().setSSS();
    Function asdf = AreaClickedState().setSSS();
    asdf();
  } // chgsomeDetail(String GetAreaName) { END
} // end
