// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/view/screens/Forgot_Password%20_screen.dart';
import 'package:flutter_app/features/auth/view/screens/register_screen.dart';
import 'package:flutter_app/features/auth/widgets/custom_DividerWithText.dart';
import 'package:flutter_app/features/auth/widgets/custom_RememberMeWidget.dart';
import 'package:flutter_app/features/auth/widgets/custom_SocialButtom0.dart';
import 'package:flutter_app/features/auth/widgets/custom_Text.dart';
import 'package:flutter_app/features/auth/widgets/custom_icon_button.dart';
import 'package:flutter_app/features/auth/widgets/custom_textFromField.dart';
// ignore: unused_import
import '/core/components/custom_button.dart'; // تأكد من صحة المسار للزر الموحد

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 15, 12, 12),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 59, 62, 32),
              const Color.fromARGB(255, 14, 14, 14),
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              custom_icon_Button(onPressed: () => RegisterScreen()),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD4FF00).withOpacity(0.8),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/image 6.png',
                  ), // استبدلها بمسار شعار مشروعك
                ),
              ),
              const SizedBox(height: 40),
              custom_Text(
                text: 'Welcome Back!',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Center(
                child: custom_Text(
                  text:
                      'Sign in to access smart, personalized travel\n                   plans made for you.',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: custom_Text(text: 'E-mail address*', fontSize: 15),
              ),
              SizedBox(height: 10),
              CustomTextfromfield(
                controller: _emailController,
                labelText: 'Email*',
                hintText: 'example@gmail.com',
              ),

              // حقل البريد الإلكتروني
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: custom_Text(text: 'Password*', fontSize: 15),
              ),
              SizedBox(height: 8),
              // حقل كلمة المرور
              CustomTextfromfield(
                controller: _passwordController,
                labelText: 'Password*',
                hintText: '@Sn123hsn#',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RememberMeWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),

              // زر نسيت كلمة المرور
              CustomButton(
                text: 'sign in',
                onPressed: () => RegisterScreen(),
                color: Color(0xFFe5fd5e),
              ),
              const SizedBox(height: 20),

              // زر تسجيل الدخول (باستخدام المكون الموحد)
              DividerWithText(),
              const SizedBox(height: 20),

              // أزرار التواصل الاجتماعي (Google / Apple)
              Row(
                children: [
                  Expanded(
                    child: Socialbuttom0(
                      image: AssetImage('assets/images/google.png'),
                      text: 'Google',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildSocialButton(
                      label: 'Apple',
                      icon: Icons.apple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              // رابط إنشاء حساب جديد
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget مساعد لأزرار جوجل وأبل
  Widget _buildSocialButton({required String label, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
