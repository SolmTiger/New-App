import 'package:flutter/material.dart';

class Text_Category extends StatelessWidget {
  final String text;
  final Color color;
  const Text_Category({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
