import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_now_app/models/hosikModel.dart';

class AreaClicked extends StatefulWidget {
  const AreaClicked({super.key});

  @override
  State<AreaClicked> createState() => AreaClickedState();
  State<AreaClicked> createStat2() => AreaClickedState().setSSS();
}

class AreaClickedState extends State<AreaClicked> {
  @override
  late String test;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test = Hosik.localAreaIndex.toString();
  }

  Widget build(BuildContext context) {
// @override
// Widget AreaClicked(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('test'),
            onPressed: () {
              // setState(() {
              //   // test = Hosik.localAreaIndex;
              // });
              setSSS();
            },
          ),
          Text(Hosik.localAreaIndex),
          Text(test),
          Text('data4'),
        ],
      ),
    );
  }

  setSSS() {
    print('setSSS clicked');
    setState(() {
      test = Hosik.localAreaIndex.toString();
    });
  }
}
