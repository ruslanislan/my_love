import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/widgets/header_text_5.dart';
import 'package:my_love/widgets/next_button.dart';
import 'package:my_love/widgets/subtitle_text.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({Key? key, required this.onTap}) : super(key: key);
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
            child: SvgPicture.asset('assets/icons/relationship 1.svg'),
          ),
        ),
        Positioned(
          bottom: 314.h,
          left: 32.w,
          child: const HeaderText5(text: "Customise the backgrounds with your own photos"),
        ),
        Positioned(
          bottom: 258.h,
          left: 24.w,
          child: const SubtitleText(
            text: "Always remind you when were\nall your events",
          ),
        ),
        Positioned(
          left: 58.w,
          bottom: 98.h,
          child: NextButton(
            onTap: onTap,
          ),
        )

      ],
    );
  }
}
