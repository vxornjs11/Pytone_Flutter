import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
// import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart'; // 안되면 윗줄 지우고 이걸로 적용해보기

void main() async {
  KakaoSdk.init(
    nativeAppKey: '',
  );
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Now',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
