import 'package:flutter/material.dart';

class BorderStyle extends Decoration {
/*  final double borderColor;
  final double borderRadius;
  final double topBoxShadowColor;
  final double topBoxShadowSpreadRadius;
  final double topBoxShadowBlurRadius;
  final double topBoxShadowOffsetWidth;
  final double topBoxShadowOffsetHeight;
  final double bottomBoxShadowColor;
  final double bottomBoxShadowSpreadRadius;
  final double bottomBoxShadowBlurRadius;
  final double bottomBoxShadowOffsetWidth;
  final double bottomBoxShadowOffsetHeight;*/

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _MyBoxPainter(this);
  }
}

class _MyBoxPainter extends BoxPainter {
  final BorderStyle decoration;
  final Paint painter;

  _MyBoxPainter(this.decoration) : painter = Paint();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var size = configuration.size;
    Offset leftTop = offset;
    Offset rightTop = leftTop.translate(size.width, 0);
    Offset leftBottom = leftTop.translate(0, size.height);
    Offset rightBottom = leftTop.translate(size.width, size.height);

    canvas.drawLine(leftTop, rightTop, painter);
    canvas.drawLine(leftTop, leftBottom, painter);
    canvas.drawLine(rightTop, rightBottom, painter);
    canvas.drawLine(leftBottom, rightBottom, painter);

    var textPainter = TextPainter(
      text: TextSpan(
        text: "测试",
        style: TextStyle(
          backgroundColor: Colors.green,
          color: Colors.red,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, (leftTop + rightBottom) / 2);
  }
}
