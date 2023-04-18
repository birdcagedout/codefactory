import 'package:flutter/material.dart';
import 'package:p06_webview2/screen/home_screen.dart';

// webview 4.0 기준 코드 예제임
// webview 3.0 기준 코드는 p06_webview1 예제를 볼 것!!


void main() {
  // 4.0 쓰려면 명시적으로 호출: Flutter Framework가 앱이 실행가능할 때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    )
  );
}
