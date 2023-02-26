import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//
// Create on 2023-02-21
// author: Sangwon Kim
// Description: 로딩 위젯
//

class CustomLoader extends StatelessWidget {
  final bool onLoad;
  const CustomLoader({super.key, required this.onLoad});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: onLoad
            ? SizedBox(
                width: 200,
                child: Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'), // 타자치는 애
              )
            : const SizedBox());
  }
}
