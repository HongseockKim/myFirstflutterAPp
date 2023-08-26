import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class SubPage extends StatefulWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  bool isLocationPermissionGranted = false;

  Future<void> permission() async {
    final status = await Permission.location.request();
    final camera = await Permission.camera.request();
    final audio = await Permission.microphone.request();
    final video = await Permission.camera.request(); // 비디오 권한 요청 추가
    if (status.isGranted &&
        camera.isGranted &&
        audio.isGranted &&
        video.isGranted) {
      setState(() {
        isLocationPermissionGranted = true;
      });
    } else {
      isLocationPermissionGranted = false;
    }
  }

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
          child: isLoadWebBiew(),
          bottom: true,
        ));
  }

  isLoadWebBiew() {
    permission();
    if (isLocationPermissionGranted)
      return InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse('https://www.bankx.co.kr/')),
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(useHybridComposition: true),
        ),
      );
  }
}
