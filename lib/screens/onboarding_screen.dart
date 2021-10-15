import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'count_screen.dart';
import 'onboarding_screens/onboarding_screen_2.dart';
import 'onboarding_screens/onboarding_screen_3.dart';
import 'onboarding_screens/onboarding_screen_4.dart';
import 'onboarding_screens/onboarding_screen_5.dart';
import 'onboarding_screens/onboarding_screen_6.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFBBC7), Color(0xFFFF899D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            OnboardingScreen2(
              onTap: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingScreen3(
              onTap: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingScreen4(
              onTap: () {
                pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingScreen5(
              onTap: () {
                pageController.animateToPage(
                  4,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingScreen6(
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (_) => const CountScreen(),
                );
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
