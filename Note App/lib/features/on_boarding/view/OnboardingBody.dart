// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';
import 'package:flutter_app/features/on_boarding/model/on-boarding_Model.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingModel model;
  final PageController controller;
  OnboardingBody({super.key, required this.model, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse(model.color)),
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
            ],
          ),
          SizedBox(height: 120),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
          const SizedBox(height: 50),
          Image.asset(model.image, height: 320),

          const Spacer(flex: 2),

          ElevatedButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInQuad,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
