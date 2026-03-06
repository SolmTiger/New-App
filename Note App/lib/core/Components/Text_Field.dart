import 'package:flutter/material.dart';

class Text_field extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const Text_field({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
