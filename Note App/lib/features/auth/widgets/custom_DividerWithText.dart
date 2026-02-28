import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      // مسافة عمودية حول السطر
      child: Row(
        children: [
          // السطر الأيسر
          const Expanded(
            child: Divider(
              color: Colors.white24, // لون رمادي خفيف يتناسب مع التصميم الداكن
              thickness: 1, // سمك السطر
            ),
          ),

          // النص في المنتصف
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ), // مسافة حول النص
            child: Text(
              'Or continue with',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6), // لون نص باهت قليلاً
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // السطر الأيمن
          const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
        ],
      ),
    );
  }
}
