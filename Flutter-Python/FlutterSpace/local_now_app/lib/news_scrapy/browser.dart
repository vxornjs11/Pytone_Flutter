import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:lottie/lottie.dart';

class browser extends StatefulWidget {
  final String name;
  const browser({super.key, required this.name});
  // const Notice_main({Key? key}) : super(key: key);
  // String name = name.toString();
  @override
  State<browser> createState() => _browserState();
}

class _browserState extends State<browser> {
  late WebViewController controller;
  late bool isLoading;
  late String siteName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true; // for indicator
    siteName = widget.name.toString();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              isLoading = true;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse("https://$siteName"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isLoading
              ? Center(
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_7x45GFUqeu.json'), // 타자치는 애
                )
              : Stack(),
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          backProcess(context);
        },
      ),
    );
  }

  // --- functions
  Future<bool> backProcess(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction(context);
      return Future.value(false);
    }
    return Future.value(true);
  }

  snackBarFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('처음화면 입니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
