import 'package:flutter/material.dart';

class custom_Text_Field extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final Widget? icon;
  final Color? fillColor;
  final TextEditingController? controller;

  const custom_Text_Field({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.icon,
    this.fillColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: const Color.fromARGB(255, 17, 10, 10)),
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
        icon: icon ?? null,
        hintText: hintText ?? '',
        prefixIconColor: const Color.fromARGB(255, 165, 130, 130),
        filled: true,
        fillColor: const Color.fromARGB(255, 167, 160, 160).withOpacity(0.1),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 150, 88, 88)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 232, 221, 221),
            width: 5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
