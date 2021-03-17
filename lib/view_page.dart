import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/all/all_page.dart';

class ViewPage extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ViewPageController controller;

  ViewPage({Key key, this.onPageChanged, this.controller}) : super(key: key);

  @override
  _ViewPageState createState() {
    return _ViewPageState();
  }
}

class _ViewPageState extends State<ViewPage> {
  PageController _pageController = PageController(viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller._pageController = _pageController;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapItem(AllPage(title: '1')),
              _wrapItem(AllPage(title: '2')),
              _wrapItem(AllPage(title: '3')),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(padding: EdgeInsets.all(10.0), child: widget);
  }
}

class ViewPageController {
  PageController _pageController;
  void jumpTopage(int page) {
    _pageController?.jumpToPage(page);
  }
}
