import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/utils/tools.dart';

class BoxScaffold extends StatefulWidget {
  final String title;
  final bool appBar;
  final Widget leadingIcon;
  final Widget actions;
  final bool iconLeft;
  final bool iconRight;
  final GestureTapCallback onTapLeading;
  final GestureTapCallback onActions;
  final Widget child;
  final bool boxBorDer;

  const BoxScaffold({
    Key key,
    this.title,
    this.appBar = true,
    this.leadingIcon,
    this.actions,
    this.iconLeft = true,
    this.iconRight = false,
    this.onTapLeading,
    this.onActions,
    this.child,
    this.boxBorDer = true,
  }) : super(key: key);

  @override
  _BoxScaffoldState createState() => _BoxScaffoldState();
}

class _BoxScaffoldState extends State<BoxScaffold> {
  @override
  Widget build(BuildContext context) {
    double _top = MediaQuery.of(context).padding.top;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        margin: EdgeInsets.only(top: _top + 10, left: 8, right: 8, bottom: 10),
        child: Column(
          children: [
            widget.appBar == false
                ? SizedBox()
                : Container(
                    //height: 59,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Row(
                      children: [
                        widget.iconLeft == false
                            ? Container(
                                height: 35,
                                width: 50,
                                margin: EdgeInsets.only(right: 10),
                              )
                            : GestureDetector(
                                onTap: () => widget.onTapLeading != null
                                    ? widget.onTapLeading
                                    : maybePop(),
                                child: Container(
                                  height: 35,
                                  width: 50,
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  child: widget.leadingIcon != null
                                      ? widget.leadingIcon
                                      : Icon(
                                          Icons.arrow_back_ios,
                                          color: SetColor.mainTypeFace,
                                        ),
                                  decoration: BoxDecoration(
                                    color: SetColor.myBackgroundColor,
                                    border:
                                        Border.all(color: Color(0xffd1d9e6)),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: SetColor.shadowDarkLight,
                                        spreadRadius: 1,
                                        offset: Offset(1, 1),
                                      ),
                                      BoxShadow(
                                        color: SetColor.shadowLight,
                                        spreadRadius: 1,
                                        offset: Offset(-1, -1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '文本',
                              style: TextStyle(
                                color: SetColor.mainTypeFace,
                                fontSize: SetSize.subTitle,
                              ),
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
                        widget.iconRight == false
                            ? Container(
                                height: 35,
                                width: 50,
                                margin: EdgeInsets.only(right: 10),
                              )
                            : GestureDetector(
                                onTap: () => widget.onActions,
                                child: Container(
                                  height: 35,
                                  width: 50,
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.center,
                                  child: widget.actions != null
                                      ? widget.actions
                                      : Icon(
                                          Icons.search,
                                          color: SetColor.mainTypeFace,
                                        ),
                                  decoration: BoxDecoration(
                                    color: SetColor.myBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: SetColor.shadowDarkLight,
                                        spreadRadius: 1,
                                        offset: Offset(1, 1),
                                      ),
                                      BoxShadow(
                                        color: SetColor.shadowLight,
                                        spreadRadius: 1,
                                        offset: Offset(-1, -1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
            widget.child == null ? Container() : widget.child,
          ],
        ),
        decoration: widget.boxBorDer
            ? BoxDecoration(
                color: SetColor.myBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: SetColor.shadowLight,
                    spreadRadius: 1,
                    offset: Offset(2, 1),
                  ),
                  BoxShadow(
                    color: SetColor.shadowDarkLight,
                    spreadRadius: 1,
                    offset: Offset(-1, -1),
                  ),
                ],
              )
            : BoxDecoration(),
      ),
    );
  }
}
