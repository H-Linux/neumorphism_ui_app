import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/utils/tools.dart';

class BoxContainer extends StatefulWidget {
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;
  final bool sunken;
  final double radius;

  const BoxContainer({
    Key key,
    this.alignment = Alignment.centerLeft,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.child,
    this.sunken = true, this.radius = 10,
  }) : super(key: key);

  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        margin: widget.margin,
        alignment: widget.alignment,
        child: widget.child,
        decoration: BoxDecoration(
          color: SetColor.myBackgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: [
            BoxShadow(
              color: widget.sunken
                  ? SetColor.shadowLight
                  : SetColor.shadowDarkLight,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
            BoxShadow(
              color: widget.sunken
                  ? SetColor.shadowDarkLight
                  : SetColor.shadowLight,
              spreadRadius: 1,
              offset: Offset(-1, -1),
            ),
          ],
        ));
  }
}
