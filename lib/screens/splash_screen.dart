import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_love/screens/menu_screen.dart';
import 'package:my_love/services/preferences_provider.dart';
import 'package:my_love/widgets/header_text_5.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _openScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFBBC7), Color(0xFFFF899D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 252.h,
            left: 88.w,
            child: SizedBox(
              width: 200.w,
              height: 182.h,
              child: SvgPicture.asset(
                "assets/icons/white_heart.svg",
              ),
            ),
          ),
          Positioned(
            bottom: 266.h,
            right: 32.w,
            child: const HeaderText5(text: "My Love:\nRelationship Counter"),
          )
        ],
      ),
    );
  }

  void _openScreen() async {
    bool isFirst = await PreferencesProvider().isFirstInit();

    if (!isFirst) {
      Route route = PageRouteBuilder(
        pageBuilder: (c, a1, a2) => OnboardingScreen(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 650),
      );
      Route route2 = MaterialPageRoute(builder: (_) => OnboardingScreen());
      Navigator.pushReplacement(
        context,
        route,
      );
    } else {
      Route route = PageRouteBuilder(
        pageBuilder: (c, a1, a2) => MenuScreen(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 650),
      );
      Route route2 = MaterialPageRoute(builder: (_) => MenuScreen());
      Navigator.pushReplacement(
        context,
        route,
      );
    }
  }
}
