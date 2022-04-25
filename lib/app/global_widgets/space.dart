import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double height;
  final double width;

  Space.Y(double y)
      : height = y,
        width = 0;

  Space.X(double x)
      : width = x,
        height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}