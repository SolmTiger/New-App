// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/core/Components/custom_button.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_Text.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_icon_button.dart';
import 'package:flutter_app/features/auth/views/widgets/custom_textFromField.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                custom_icon_Button(onPressed: () => Navigator.pop(context)),
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
                      height: 50,
                    ), // استبدلها بمسار شعار مشروعك
                  ),
                ),
                SizedBox(height: 30),
                custom_Text(
                  text: 'Forgot Password ?',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    custom_Text(
                      text:
                          ' Enter Your email and we will send a 5_digit\n              verification code instantly.',
                      fontSize: 15,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: custom_Text(text: 'E-mail address*', fontSize: 15),
                ),
                SizedBox(height: 5),
                CustomTextfromfield(hintText: 'example@gmail.com'),
                SizedBox(height: 20),
                CustomButton(text: 'Send Code', onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.only(top: 370),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    spacing: 5,
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
