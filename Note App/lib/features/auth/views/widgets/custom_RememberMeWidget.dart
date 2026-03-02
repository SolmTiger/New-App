// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  });

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRemembered = false;

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      print("Retrieved data: email=$email, password=$password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Theme(
          // تخصيص شكل المربع ليتطابق مع طلبك
          data: ThemeData(unselectedWidgetColor: Colors.grey),
          child: Checkbox(
            value: _isRemembered,
            activeColor: Colors.blue, // يتغير للون الأزرق عند الضغط عليه
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ), // حواف دائرية بسيطة للمربع
            ),
            side: const BorderSide(
              color: Colors.white24,
              width: 1.5,
            ), // لون الإطار وهو غير نشط
            onChanged: (bool? value) async {
              setState(() {
                _isRemembered = value ?? false;
              });

              // استدعاء دالة الحفظ عند تغير القيمة
              await saveData();
              print(
                "Saved data: email=${_emailController.text}, password=${_passwordController.text}, remember_me=$_isRemembered",
              );
            },
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.grey, // نفس لون النص في الصورة
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // دالة برمجية بسيطة لشرح فكرة حفظ البيانات
  void _saveData() {
    print("تم تفعيل حفظ البيانات");
    // هنا يمكنك استخدام SharedPreferences لحفظ حالة تسجيل الدخول
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
