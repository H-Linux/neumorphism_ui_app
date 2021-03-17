import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page/drawer/drawer_page.dart';
import 'utils/tools.dart';
import 'utils/transparent_router.dart';
import 'view_page.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int _currentIndex = 0;
  final ViewPageController _viewPageController = ViewPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SetColor.myBackgroundColor,
      body: BoxScaffold(
        bottomNavBar: _bottomNavBar(),
        iconRight: true,
        leadingIcon: Icon(Icons.dehaze),
        onTapLeading: () => Navigator.of(context).push(
            TransparentRouter(builder: (BuildContext context) => DrawerPage())),
        onActions: () {},
        child: ViewPage(
          controller: _viewPageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      //height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(icon: Icons.pages, index: 0),
          _bottomNavItem(icon: Icons.pages, index: 1),
          _bottomNavItem(icon: Icons.pages, index: 2),
        ],
      ),
    );
  }

  Widget _bottomNavItem({IconData icon, int index}) {
    bool _sunken = false;
    _sunken = index == _currentIndex ? true : false;

    return GestureDetector(
      onTap: () {
        setState(() {
          _viewPageController.jumpTopage(index);
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
          ],
        ),
      ),
    );
  }
}
