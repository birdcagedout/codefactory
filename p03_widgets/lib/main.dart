import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StackApp(),
  ));
}

// p.127 Text 위젯
class TextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Code',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue,
              ),
            ),
            Text(
              'Factory',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// p.130 Button 3가지 위젯
class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 화면 가운데 위치하기 위해 Container로 wrap
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('텍스트 버튼 눌림');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('텍스트 버튼'),
            ),
            OutlinedButton(
              onPressed: () {
                print('아웃라인드 버튼 눌림');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              child: Text('이웃라인드 버튼'),
            ),
            ElevatedButton(
              onPressed: () {
                print('엘리베이티드 버튼 눌림');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text('엘리베이티드 버튼'),
            ),
          ],
        ),
      ),
    );
  }
}

// p.132 IconButton 위젯
class IconButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            print('아이콘 버튼 눌림');
          },
          icon: const Icon(Icons.home),
          iconSize: 60,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}

// p.132 GestureDetector 위젯
class GestureDetectorApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            print('한번 탭하기');
          },
          onDoubleTap: () {
            print('두번 탭하기');
          },
          onLongPress: () {
            print('길게 누르기');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            width: 100.0,
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('한번 탭하기', style: TextStyle(fontSize: 20)),
                Text('두번 탭하기', style: TextStyle(fontSize: 20)),
                Text('길게 탭하기', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// p.134 FloatingActionButton 위젯
class FloatingActionButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('플로팅액션버튼 눌림');
        },
        child: Text('클릭'),
      ),
      body: Container(),
    );
  }
}

// p.135 Container 위젯
class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.yellow.shade400,
          border: Border.all(
            width: 5.0,
            color: Colors.amber.shade700,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: 300,
        height: 250,
      ),
    );
  }
}

// p.136 SizedBox 위젯
class SizedBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        height: 300.0,
        // sizedbox는 색이 없으므로 크기를 확인하기 위해 Container 추가
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}

// p.136 Padding 위젯
class PaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              color: Colors.red,
              width: 16.0,
              height: 16.0,
            )),
      ),
    );
  }
}

// p.137 Margin을 적용한 Container
class ContainerWithMarginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        // 최상위 Container(파란색)
        child: Container(
      color: Colors.blue,
      // 중간 Container with margin(빨간색)
      child: Container(
        color: Colors.red,
        // 마진 적용 ==> 파란색 부분
        margin: EdgeInsets.all(30.0),
        // 패딩 적용 ==> 빨간색 부분
        child: Padding(
          padding: EdgeInsets.all(10.0),
          // 패딩 안쪽 Container
          child: Container(
            color: Colors.amber,
            width: 200,
            height: 300,
          ),
        ),
      ),
    ));
  }
}

// p.138 SafeArea 위젯
class SafeAreaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top, bottom, left, right에 각각 true/false 적용 가능
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Container(
        alignment: Alignment.topLeft,
        color: Colors.blue,
        width: 0,
        height: 0,
      ),
    );
  }
}


// p.140 Row 위젯
class RowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              width: 50.0,
              height: 50.0,
              color: Colors.red,
            ),

            const SizedBox(
              width: 12.0,
            ),
            Container(
              width: 50.0,
              height: 50.0,
              color: Colors.green,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Container(
              width: 50.0,
              height: 50.0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}


// p.144 Column 위젯
class ColumnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 원하는 위젯
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            // SizedBox는 공백으로 사용
            // SizedBox(width: 12,),
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            // const SizedBox(width: 12,),
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}


// p.147 Flexible 위젯
class FlexibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,    // 2/(2+4) = 33%
          child: Container(
            color: Colors.blue,
          ),
        ),
        Flexible(
          flex: 4,    // 4/(2+4) = 66%
          child: Container(
            color: Colors.red,
          )
        )
      ],
    );
  }
}


// p.148 Expanded 위젯
class ExpandedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

// p.149 Stack 위젯
class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // 첫번째(최외곽)
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
          ),

          // 두번쩨(중간)
          Container(
            margin: EdgeInsets.all(25),
            width: 250,
            height: 250,
            color: Colors.yellow,
          ),

          // 세번째(최내부)
          Container(
            margin: EdgeInsets.all(50),
            width: 200,
            height: 200,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}