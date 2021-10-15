import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/screens/count_screen.dart';
import 'package:my_love/widgets/header_text_5.dart';
import 'package:my_love/widgets/next_button.dart';
import 'package:my_love/widgets/subtitle_text.dart';
import 'package:my_love/widgets/subtitle_text_2.dart';

class OnboardingScreen6 extends StatelessWidget {
  const OnboardingScreen6({Key? key, required this.onTap, this.onCloseTap}) : super(key: key);
  final VoidCallback onTap;
  final VoidCallback? onCloseTap;

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
        child: Stack(
          children: [
            Positioned(
              left: 28.52.w,
              top: 72.52.h,
              child: GestureDetector(
                onTap: onCloseTap ?? () {
                  Route route = MaterialPageRoute(
                    builder: (_) => const CountScreen(),
                  );
                  Navigator.pushReplacement(context, route);
                },
                child: SvgPicture.asset("assets/icons/Union.svg"),
              ),
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
                text: "FREE unlimited\naccess",
              ),
            ),
            Positioned(
              left: 58.w,
              bottom: 98.h,
              child: NextButton(
                text: "Start FREE",
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
                  },
                  child: const SubtitleText2(text: "Term of Use | Privacy Policy")),
            ),
          ],
        ),
      ),
    );
  }
}
