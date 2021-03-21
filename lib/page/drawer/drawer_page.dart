import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neumorphism_ui_app/utils/tools.dart';

import '../../router_page.dart';
import '../../utils/tools.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 16),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: SetColor.grey.withOpacity(0.6),
                              offset: const Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/userImage.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 16, bottom: 10),
                    child: Text(
                      'Future Style',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: SetColor.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(height: 0.3, color: SetColor.grey.withOpacity(0.6)),
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      children: [
                        TileList(
                          icon: Icon(Icons.home),
                          tile: 'ALL1',
                        ),
                        TileList(
                          icon: Icon(Icons.home),
                          tile: 'ALL2',
                        ),
                        TileList(
                          icon: Icon(Icons.home),
                          tile: 'ALL3',
                        ),
                        TileList(
                          icon: Icon(Icons.help),
                          tile: 'help',
                        ),
                        TileList(
                          icon: Icon(Icons.share),
                          tile: 'Rate the app',
                        ),
                        TileList(
                          icon: Icon(Icons.info),
                          tile: 'About Us',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: BoxContainer(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Row(
                        children: [
                          Text('退出'),
                          Spacer(),
                          GestureDetector(
                            onTap: () => _showDialog(),
                            child: Icon(
                              Icons.power_settings_new,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 0.3, color: SetColor.grey.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
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

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: CupertinoAlertDialog(
            content: Text('是否退出应用？'),
            actions: [
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () =>
                    pushAndRemoveUntil(RouterPage(), RouterType.fade),
              ),
              CupertinoDialogAction(
                child: Text('确认'),
                isDestructiveAction: true,
                onPressed: () => SystemNavigator.pop(animated: true),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TileList extends StatefulWidget {
  final Icon icon;
  final String tile;
  final Icon edIcon;
  final Widget onTap;
  final GestureTapCallback onTapEd;
  final bool sunken;

  const TileList({
    Key key,
    this.icon,
    this.tile,
    this.edIcon,
    this.onTap,
    this.onTapEd,
    this.sunken = false,
  }) : super(key: key);

  @override
  _TileListState createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool sunken = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          sunken = widget.sunken == false ? true : false;
        });
        routePush(widget.onTap);
      },
      highlightColor: SetColor.grey.withOpacity(0.4),
      splashColor: SetColor.grey,
      child: BoxContainer(
        sunken: sunken,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          children: [
            widget.icon != null
                ? Row(
                    children: [
                      widget.icon,
                      SizedBox(width: 10),
                    ],
                  )
                : SizedBox(),
            widget.tile != null ? Text(widget.tile) : SizedBox(),
            Spacer(),
            widget.edIcon != null
                ? GestureDetector(
                    onTap: widget.onTapEd,
                    child: widget.edIcon,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
