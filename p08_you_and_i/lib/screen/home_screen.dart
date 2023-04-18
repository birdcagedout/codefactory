import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


// 스테이트
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,    // 아랫쪽만 화면 끝까지 사용
        child: Container(
          width: MediaQuery.of(context).size.width,   // 가로(width) 최대 사이즈로 사용
          child: Column(
            children: [
              _TopPart(),
              _BottomPart(),
            ],
          )
        ),
      ),
    );
  }
}


// 화면 위쪽 부분: 위젯
class _TopPart extends StatefulWidget {
  const _TopPart({Key? key}) : super(key: key);

  @override
  State<_TopPart> createState() => _TopPartState();
}

// 화면 위쪽 부분: 스테이트
class _TopPartState extends State<_TopPart> {
  // 날짜
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(    // 위쪽 절반 모두 사용(확장)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('U&I',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',   // font 사용할 때는 따옴표 사용
              fontSize: 80.0,
            ),
          ),
          Text(
            '우리 처음 만난 날',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',    // font 사용할 때는 따옴표 사용
              fontSize: 30.0,
            ),),
          Text(
            '2021. 12. 27.',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',     // font 사용할 때는 따옴표 사용
              fontSize: 20.0,
            ),
          ),
          IconButton(
            iconSize: 60.0,     // IconButton의 iconSize를 60한 것과 Icon의 size를 60한 것을 꼭 비교할 것!! (결론: iconSize 사용할 것!!)
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              // size: 60.0,    // 위치 삐뚤어짐
            ),
            onPressed: () {
              // 대화상자(dialog) 띄우기
              showCupertinoDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 300.0,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime dt) {
                          print(dt);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Text(
            'D+1',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',    // font 사용할 때는 따옴표 사용
                fontSize: 50.0,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}



// 화면 아래쪽 부분: 위젯
class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Expanded: 화면의 아래 절반을 모두 채워서 사용하기 위해
    // 윗부분만 Expanded 쓰고, 아랫부분만 Expanded 안 쓰면 ==> 이미지가 화면 가득 채우고 + 이미지 짤린다(bottom overflowed)
    // 윗부분도 Expanded 안 쓰고, 아랫부분도 Expanded 안 쓰면 ==> 화면 아래 절반에 이미지 너무 크게 나오면 + 이미지 짤린다(bottom overflowed)
    return Expanded(
      child: Image.asset(
        'assets/img/middle_image.png',
      )
    );
  }
}


