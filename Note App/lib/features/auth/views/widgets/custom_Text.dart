import 'package:flutter/material.dart';

class custom_Text extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const custom_Text({
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
