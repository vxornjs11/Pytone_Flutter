import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                // 'https://assets7.lottiefiles.com/packages/lf20_c5vj9laj.json'), // 고양이
              )
            : const SizedBox());
  }
}
