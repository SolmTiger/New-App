import 'package:flutter/material.dart';

class CustomTextfromfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  CustomTextfromfield({
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      obscureText: false == obscureText ? true : false,
      controller: controller,
      decoration: InputDecoration(
        // 1. النصوص (Label & Hint)
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),

        // 2. تلوين خلفية الحقل كما في الصورة
        filled: true,
        fillColor: Colors.white.withOpacity(0.05), // رمادي داكن جداً شفاف
        // 3. الإطار في حالته العادية (Enabled)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // زوايا منحنية دائرية
          borderSide: const BorderSide(
            color: Colors.white24, // إطار أبيض باهت كما في الصورة
            width: 1.0,
          ),
        ),

        // 4. الإطار عند الضغط عليه (Focused)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white, // أبيض صريح عند التفاعل
            width: 1.5,
          ),
        ),

        // 5. مسافات داخلية للحصول على نفس الارتفاع
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }
}
