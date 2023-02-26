import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class mapTest extends StatefulWidget {
  const mapTest({super.key});

  @override
  State<mapTest> createState() => _mapTestState();
}

class _mapTestState extends State<mapTest> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '대한민국 지도',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: med.width * 0.8,
                    height: med.height * 0.8,
                    child: Image.asset(
                      'images/map.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            // 강원도
            top: med.height * 0.13,
            left: med.width * 0.47,
            child: Container(
              width: med.width * 0.4,
              height: med.height * 0.19,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            // 수도권
            top: med.height * 0.17,
            left: med.width * 0.17,
            child: Container(
              width: med.width * 0.3,
              height: med.height * 0.17,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            // 전라도
            top: med.height * 0.44,
            left: med.width * 0.17,
            child: Container(
              width: med.width * 0.35,
              height: med.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            // 경상도
            top: med.height * 0.32,
            left: med.width * 0.54,
            child: Container(
              width: med.width * 0.35,
              height: med.height * 0.28,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            // 충청도
            top: med.height * 0.33,
            left: med.width * 0.18,
            child: Container(
              width: med.width * 0.35,
              height: med.height * 0.10,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            // 충청도
            top: med.height * 0.69,
            left: med.width * 0.18,
            child: Container(
              width: med.width * 0.18,
              height: med.height * 0.05,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
