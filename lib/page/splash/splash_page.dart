import 'dart:async';
import 'package:flutter/material.dart';

import 'package:neumorphism_ui_app/utils/tools.dart';
import '../../router_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _countTimer;
  int _countDown = 6;

  void _startCountDown() {
    _countTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_countDown < 1) {
            routePush(RouterPage(), RouterType.size);
            _countTimer.cancel();
            _countTimer = null;
          } else {
            _countDown -= 1;
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SetColor.myBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Center(
              child: Text(
                'Neumorphism UI',
                style: TextStyle(
                  color: SetColor.mainTypeFace,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  routePush(RouterPage(), RouterType.size);
                  _countTimer.cancel();
                  _countDown = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '跳过 $_countDown',
                  style: TextStyle(color: SetColor.mainTypeFace),
                ),
                decoration: BoxDecoration(
                  color: SetColor.myBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: SetColor.shadowLight,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                    ),
                    BoxShadow(
                      color: SetColor.shadowDarkLight,
                      spreadRadius: 1,
                      offset: Offset(-1, -1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _countTimer.cancel();
    _countDown = 0;
  }
}
