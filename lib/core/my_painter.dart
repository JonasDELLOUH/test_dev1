// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class MyPainter extends CustomPainter {
//
//   late Paint painter;
//   late PageController pageController;
//
//   MyPainter({required this.pageController}): super(
//       repaint: pageController
//   ) {
//     painter = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     const radius = 20.0;
//     const dy = 15.0;
//     const dxCurrent = 25.0;
//     const dxTarget = 125.0;
//     final position = pageController.position;
//     final extent = (position.maxScrollExtent - position.minScrollExtent + position.viewportDimension);
//     final offset = position.extentBefore / extent;
//     bool toRight = dxCurrent < dxTarget;
//     Offset entry = Offset(toRight ? dxCurrent : dxTarget, dy);
//     Offset target = Offset(toRight? dxTarget : dxCurrent, dy);
//     Path path = Path();
//     path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
//     path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
//     path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);
//     canvas.translate(size.width * offset, 0);
//     canvas.drawShadow(path, Colors.grey, 7.5, true);
//     canvas.drawPath(path, painter);
//     }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }