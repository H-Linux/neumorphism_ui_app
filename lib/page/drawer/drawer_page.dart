import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/utils/tools.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: SetColor.myBackgroundColor,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 8, right: 8),
              child: Column(
                children: [],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => pop(),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ],
      ),
    );
  }
}
