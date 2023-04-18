import 'package:flutter/material.dart';


// <Sateful Widget 만들기>
// 1. 직접 작성
// 2. 만들어진 Stateless 클래스명에 Show Context Action - Convert to Stateful Widget
// 3. Stful 단축키



// 1. 색깔 받아서 컨테이너 리턴하는 Stateless 위젯
class HomeScreen1 extends StatelessWidget {
  final Color color;

  const HomeScreen1({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: color,
    );
  }
}


// 2. HomeScreen을 Stateful 위젯으로 다시 만들어본다
class HomeScreen2 extends StatefulWidget {
  final Color color;

  const HomeScreen2({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen2> createState() {
    return _HomeScreen2State();
  }
}


// 2-1. HomeScreen2의 State
class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: widget.color,
    );
  }
}


// 3. Stateful로 HomeScreen에 기능을 넣어서 다시 만든다
class HomeScreen extends StatefulWidget {
  final Color color;

  // const 생성자에는 함수 body를 넣을 수 없다
  // 일반 생성자에는 함수 body를 넣을 수 있다
  HomeScreen({
    required this.color,
    Key? key
  }) : super(key: key) {
    print('위젯 생성자 실행');
  }

  @override
  State<HomeScreen> createState() {
    print('createState 실행');
    return _HomeScreenState();
  }
}

// 3-1. HomeScreen의 State
class _HomeScreenState extends State<HomeScreen> {
  int num = 0;

  @override
  void initState() {
    print('initState 실행');
    super.initState();    // 필수(반드시 호출해야 함)
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행');
    super.didChangeDependencies();  // 필수(반드시 호출해야 함)
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행');
    return GestureDetector(
      onTap: () {
        print('1번 Tap');

        // setState(파라미터 함수)
        // 변경하고 싶은 값을 파라마터 함수 내에서 변경 ==> build() 다시 실행된다
        setState(() {
          num++;    // state의 속성 변경
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(num.toString()),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('didUpdateWidget 실행');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate 실행');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행');
    super.dispose();
  }
}
