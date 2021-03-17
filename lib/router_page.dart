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
        bottomNavBar: _bottomNavBar(),
        iconRight: true,
        leadingIcon: Icon(Icons.dehaze),
        onTapLeading: () {},
        onActions: () {},
        child: Container(
          child: Text('红色'),
        ),
      ),
    );
  }

  int _currentIndex = 0;

  Widget _bottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      //height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(/*title: '首頁', */ icon: Icons.pages, index: 0),
          _bottomNavItem(/*title: '首頁', */ icon: Icons.pages, index: 1),
          _bottomNavItem(/*title: '首頁', */ icon: Icons.pages, index: 2),
        ],
      ),
    );
  }

  Widget _bottomNavItem({/*String title, */IconData icon, int index}) {
    bool _sunken = false;
    _sunken = index == _currentIndex ? true : false;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: BoxContainer(
        sunken: _sunken,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 24),
            /*Text(
              title,
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),*/
          ],
        ),
      ),
    );
  }
}
