import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/widget_connme/box_scaffold.dart';

import 'utils/tools.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphism UI',
      theme: ThemeData(primaryColor: SetColor.myBackgroundColor),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => RouterPage(),
      },
    );
  }
}

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SetColor.myBackgroundColor,
      body: BoxScaffold(
        iconLeft: false,
      ),
    );
  }
}
