// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*7.253086419753086).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter({
    this.color = Colors.white,
  });

  Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1570066);
    path_0.lineTo(size.width * 0.7099727, size.height * 0.1570066);
    path_0.cubicTo(
        size.width * 0.7099727,
        size.height * 0.1570066,
        size.width * 0.6899688,
        size.height * 0.3997859,
        size.width * 0.7099727,
        size.height * 0.4263923);
    path_0.cubicTo(
        size.width * 0.7299766,
        size.height * 0.4529987,
        size.width * 0.9999708,
        size.height * 0.4613125,
        size.width * 0.9999708,
        size.height * 0.4962327);
    path_0.cubicTo(
        size.width * 0.9999708,
        size.height * 0.5311529,
        size.width * 0.7199942,
        size.height * 0.5294907,
        size.width * 0.7099727,
        size.height * 0.5810386);
    path_0.cubicTo(
        size.width * 0.6999513,
        size.height * 0.6325864,
        size.width * 0.7099727,
        size.height * 0.8454348,
        size.width * 0.7099727,
        size.height * 0.8470984);
    path_0.cubicTo(size.width * 0.7099727, size.height * 0.8487620, 0,
        size.height * 0.8470984, 0, size.height * 0.8470984);
    path_0.lineTo(0, size.height * 0.1570066);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color!.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, 0);
    path_1.lineTo(size.width * 0.3992988, 0);
    path_1.arcToPoint(Offset(size.width * 0.7596416, size.height * 0.04920213),
        radius:
            Radius.elliptical(size.width * 0.3603428, size.height * 0.04920213),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 0.7596416, size.height * 0.9534574);
    path_1.arcToPoint(Offset(size.width * 0.4187768, size.height),
        radius:
            Radius.elliptical(size.width * 0.3408648, size.height * 0.04654255),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(0, size.height);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = color!.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
