import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  final String homeURL = 'https://blog.codefactory.ai';
  WebViewController? controller; // 웹뷰 내에서 콜백함수의 파라미터로 넣어줌, controller를 이용하면 webview 외부에서 webview를 조종할 수 있다.

  HomeScreen({Key? key})
      : super(key: key); // controller를 나중에 생성할 것이므로 final이 아니므로 const를 지

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
            if(controller == null) {
              print('controller가 null입니다.');
              return;
            }
            controller!.loadUrl(homeURL);   // home버튼을 누르면 ==> controller를 써서 webview를 homeURL로 이동
          }, icon: Icon(Icons.home)),
        ],
      ),
      body: WebView(
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        initialUrl: homeURL,
        javascriptMode: JavascriptMode
            .unrestricted, // 기본값은 disabled이므로 항상 unrestricted로 해줘야 함
      ),
    );
  }
}
