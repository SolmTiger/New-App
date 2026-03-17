import 'package:flutter/material.dart';

// ignore: camel_case_types
class Icon_Button extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  final Color? backgroundColor;

  const Icon_Button({
    super.key,
    this.onPressed,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5, // قوة الظل
      shape: const CircleBorder(),
      child: CircleAvatar(
        radius: 25,
        child: icon,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
