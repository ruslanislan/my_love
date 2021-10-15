import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'count_screen.dart';
import 'onboarding_screens/onboarding_screen_2.dart';
import 'onboarding_screens/onboarding_screen_3.dart';
import 'onboarding_screens/onboarding_screen_4.dart';
import 'onboarding_screens/onboarding_screen_5.dart';
import 'onboarding_screens/onboarding_screen_6.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController pageController = PageController(initialPage: 0);

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 7,
    minLaunches: 10,
    remindDays: 7,
    remindLaunches: 10,
    googlePlayIdentifier: 'fr.skyost.example',
    appStoreIdentifier: '1491556149',
  );

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
              onTap: () async {
                await rateMyApp.init();
                await rateMyApp.showStarRateDialog(
                  context,
                  title: 'Rate this app',
                  message: 'You like this app ? Then take a little bit of your time to leave a rating :',
                  actionsBuilder: (context, stars) {
                    return [
                      ElevatedButton(
                        child: const Text('OK'),
                        onPressed: () async {
                          await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                          Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
                        },
                      ),
                    ];
                  },
                  ignoreNativeDialog: Platform.isAndroid,
                  dialogStyle: const DialogStyle(
                    titleAlign: TextAlign.center,
                    messageAlign: TextAlign.center,
                    messagePadding: EdgeInsets.only(bottom: 20),
                  ),
                  starRatingOptions: const StarRatingOptions(),
                  onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
                );
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
