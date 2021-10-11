import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/services/preferences_provider.dart';
import 'package:my_love/widgets/header_text_5.dart';
import 'package:my_love/widgets/next_button.dart';
import 'package:my_love/widgets/subtitle_text.dart';
import 'package:my_love/widgets/subtitle_text_2.dart';

import '../menu_screen.dart';

class OnboardingScreen5 extends StatelessWidget {
  const OnboardingScreen5({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 28.52.w,
          top: 72.52.h,
          child: GestureDetector(
              onTap: () {
                //PreferencesProvider().saveFirstInit();
                Route route = PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const MenuScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 350),
                );
                Navigator.pushReplacement(context, route);
              },
              child: SvgPicture.asset("assets/icons/Union.svg")),
        ),
        Positioned(
          top: 172.h,
          left: 72.w,
          child: SizedBox(
            width: 230.w,
            height: 230.h,
            child: SvgPicture.asset(
              'assets/icons/wedding-ring.svg',
            ),
          ),
        ),
        Positioned(
          bottom: 314.h,
          left: 32.w,
          child: const HeaderText5(text: "The countdown of your anniversaries"),
        ),
        Positioned(
          bottom: 258.h,
          left: 24.w,
          child: const SubtitleText(
            text: "Subscribe to unlock all the features,\njust \$3.99/week",
          ),
        ),
        Positioned(
          left: 58.w,
          bottom: 98.h,
          child: NextButton(
            onTap: onTap,
          ),
        ),
        Positioned(
          bottom: 66.h,
          left: 96.w,
          child: GestureDetector(
              onTap: () {
                print('d');
              },
              child: const SubtitleText2(text: "Restore purchases")),
        ),
        Positioned(
          bottom: 38.h,
          left: 96.w,
          child: GestureDetector(
              onTap: () {
                print('a');
              },
              child: const SubtitleText2(text: "Term of Use | Privacy Policy")),
        ),
      ],
    );
  }
}
