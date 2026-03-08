import 'package:flutter/material.dart';

class Text_From_Field extends StatelessWidget {
  final Icon? icon;
  final Title? text;

  const Text_From_Field({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: 'text',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
