import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/common/set_style.dart';

class AllPage extends StatefulWidget {
  final String title;

  const AllPage({Key key, this.title}) : super(key: key);

  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SetColor.myBackgroundColor,
      body: Container(
        child: Align(
          child: Text(
            'ALL${widget.title}',
            style: TextStyle(
              color: SetColor.mainTypeFace,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
