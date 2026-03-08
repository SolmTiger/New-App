import 'package:flutter/material.dart';

class custom_elevatedbutton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onpressed;

  const custom_elevatedbutton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 1, 52, 127),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color.fromARGB(255, 184, 202, 216),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
