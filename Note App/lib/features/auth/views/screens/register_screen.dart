// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_DividerWithText.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_SocialButtom0.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_Text.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_icon_button.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_textFromField.dart';
import 'package:flutter_app/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Signup() async {
    try {
      log("Attempting to sign up user with email: ${emailController.text}");

      await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        //        data: {"name": nameController.text},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      log("بدء عملية تسجيل الدخول بجوجل...");

      // 1. استدعاء واجهة اختيار الحساب من جوجل
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        log("تم إلغاء تسجيل الدخول من قبل المستخدم");
        return;
      }

      // 2. الحصول على توكن المصادقة
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. إرسال التوكن إلى Supabase
      final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken,
      );

      if (response.user != null) {
        log("تم الدخول بنجاح! اسم المستخدم: ${response.user!.email}");
        // يمكنك هنا توجيه المستخدم للصفحة الرئيسية
      }
    } catch (error) {
      log("حدث خطأ أثناء تسجيل دخول جوجل: $error");
      // يفضل إظهار رسالة للمستخدم هنا (SnackBar)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 15, 12, 12),
      body: SingleChildScrollView(
        child: Container(
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
                custom_icon_Button(onPressed: () => LoginScreen()),
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
                SizedBox(height: 30),
                custom_Text(
                  text: 'Create Your Account ?',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                custom_Text(
                  text:
                      'Create your account to explore exciting travel \n             destinations and adventures',
                  fontSize: 14,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: custom_Text(text: 'Full Name', fontSize: 15),
                ),
                SizedBox(height: 5),
                CustomTextfromfield(
                  hintText: 'Enter your full name',
                  controller: nameController,
                ),

                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: custom_Text(text: 'Email Address', fontSize: 15),
                ),
                SizedBox(height: 5),
                CustomTextfromfield(
                  hintText: 'example@gmail.com',
                  controller: emailController,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: custom_Text(text: 'Password', fontSize: 15),
                ),
                SizedBox(height: 5),
                CustomTextfromfield(
                  hintText: 'Enter your password',
                  obscureText: false,
                  controller: passwordController,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4FF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 160,
                      vertical: 15,
                    ),
                  ),

                  onPressed: () {
                    Signup();
                  },
                  child: custom_Text(
                    text: 'Register',
                    color: const Color.fromARGB(243, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DividerWithText(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _signInWithGoogle();
                        },
                        child: Socialbuttom0(
                          image: AssetImage('assets/images/google.png'),
                          text: 'Google',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[500]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.apple, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Apple',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_Text(
                        text: 'Already have an account?',
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
