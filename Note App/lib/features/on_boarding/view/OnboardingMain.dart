// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app/features/on_boarding/Views_Model/on_boarding_data.dart';
import 'package:flutter_app/features/on_boarding/view/OnboardingBody.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  final PageController _pageController = PageController(); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية متغيرة بناءً على الموديل
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              return OnboardingBody(
                model: onboardingPages[index],
                controller: _pageController,
              );
            },
          ),

          // الـ Smooth Indicator في الأعلى
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingPages.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white38,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
