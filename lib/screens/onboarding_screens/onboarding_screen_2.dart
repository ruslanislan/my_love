import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/widgets/header_text_5.dart';
import 'package:my_love/widgets/next_button.dart';
import 'package:my_love/widgets/subtitle_text.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 172.h,
          left: 72.w,
          child: SizedBox(
            width: 230.w,
            height: 230.h,
            child: SvgPicture.asset("assets/icons/wedding-day 2.svg",),
          ),
        ),
        Positioned(
          bottom: 314.h,
          left: 32.w,
          child: const HeaderText5(
            text: "Save your\nrelationship dates",
          ),
        ),
        Positioned(
          bottom: 258.h,
          left: 24.w,
          child: const SubtitleText(
            text: "We will notify you not to miss\nyour anniversary",
          ),
        ),
        Positioned(
          bottom: 98.h,
          left: 58.w,
          child: NextButton(onTap: onTap),
        ),
      ],
    );
  }
}
