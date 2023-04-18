
import 'dart:async';                      // Timer

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';   // SystemChrome.setSystemUIOverlayStyle()


enum Direction {forward, backward}


// 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// state
class _HomeScreenState extends State<HomeScreen> {

  Direction dir = Direction.forward;
  Timer? timer;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();    // 맨 앞에

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int currentPage = controller.page!.toInt();   // page는 double값 (transition될 때 0.1, 0.5 등 소수점이 붙는다)
      print(controller.page);                       // 예를 들어 0번 사진에서 1번 사진으로 넘어가기 시작할 때 0번 사진이 90%, 1번 사진이 10% 보이는 경우 ==> controller.page = 0.1

      int nextPage = dir == Direction.forward ? currentPage + 1 : currentPage - 1;

      if (nextPage == 5) {
        dir = Direction.backward;
        nextPage -= 2;
      }

      if (nextPage == -1) {
        dir = Direction.forward;
        nextPage += 2;
      }

      // 에니메이션 효과
      controller.animateToPage(nextPage, duration: Duration(milliseconds: 400), curve: Curves.linear);
    });

  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);   // 맨 위 시계, 안테나, 와이파이, 배터리 색깔
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1,2,3,4,5].map((e) => Image.asset("assets/img/image_$e.jpeg", fit: BoxFit.cover)).toList(),
      )
    );
  }


  @override
  void dispose() {
    controller.dispose();

    // Timer 삭제: memory leak 발생 방지
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();    //  맨 뒤에
  }
}
