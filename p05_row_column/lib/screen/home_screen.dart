import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          // height: MediaQuery.of(context).size.height,  // Row crosssAxisAlignment 테스트: 상하길이 최대
          // width: MediaQuery.of(context).size.width,   // Column crosssAxisAlignment 테스트: 좌우길이 최대
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,

            children: [
              Flexible(
                flex: 10,
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.orange,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}