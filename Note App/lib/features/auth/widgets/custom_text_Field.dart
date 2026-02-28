import 'package:flutter/material.dart';

class custom_Text_Field extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final Widget? icon;
  const custom_Text_Field({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: obscureText ?? false,

      decoration: InputDecoration(
        suffixIcon: icon,
        icon: icon ?? null,
        hintText: hintText ?? '',
        prefixIconColor: Colors.white,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.9),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
