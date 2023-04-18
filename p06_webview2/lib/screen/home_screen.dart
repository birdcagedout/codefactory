import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



// 1. 홈으로 사용할 Uri를 만든다.
final homeURI = Uri.parse('http://birdcagedout.com');



class HomeScreen extends StatelessWidget {
  
  // 2. controller를 만든다 + javascript 설정 / home 접속
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeURI);
  // ..loadRequest(Uri.parse('http://birdcagedout.com'));

  HomeScreen({Key? key})
      : super(key: key); // controller를 나중에 생성할 것이므로 final이 아니므로 const 생성자를 쓰면 안 된다

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Factory 앱바'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
            print('클릭');
            controller.loadRequest(homeURI);   // home버튼을 누르면 ==> controller를 써서 webview를 homeURL로 이동
          },
            icon: Icon(Icons.home)),
        ],
      ),
      // body:
      // WebView(
      //   onWebViewCreated: (controller) {
      //     this.controller = controller;
      //   },
      //   initialUrl: homeURL,
      //   javascriptMode: JavascriptMode
      //       .unrestricted, // 기본값은 disabled이므로 항상 unrestricted로 해줘야 함
      // ),
      body: WebViewWidget(
        controller: controller,
      ),

    );
  }
}
