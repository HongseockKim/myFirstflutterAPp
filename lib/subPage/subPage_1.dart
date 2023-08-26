import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class subPage_1 extends StatefulWidget {
  const subPage_1({super.key});

  @override
  State<subPage_1> createState() => _subPage_1State();
}

class _subPage_1State extends State<subPage_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '서브 페이지',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse('https://www.harulaundry.kr/')),
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(useHybridComposition: true),
            ),
          ),
          bottom: true,
        ));
  }
}
