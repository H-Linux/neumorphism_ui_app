import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/tools.dart';

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
        iconRight: true,
        leadingIcon: Icon(Icons.dehaze),
        onTapLeading: () {},
        onActions: () {},
      ),
    );
  }
}
