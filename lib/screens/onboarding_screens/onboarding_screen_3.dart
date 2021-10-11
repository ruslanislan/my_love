import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/widgets/header_text_5.dart';
import 'package:my_love/widgets/next_button.dart';
import 'package:my_love/widgets/subtitle_text.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 172.h,
          left: 40.w,
          child: Container(
            width: 295.w,
            height: 230.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 5.r,
                color: const Color(0xFFED5565),
              ),
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/photo.png",
                  scale: 2,
                ),
                SizedBox(
                  height: 11.h,
                ),
                SvgPicture.asset("assets/icons/stars.svg"),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 247.w,
                  height: 57.h,
                  child: Text(
                    "This app helps so much\nto remember all your events\nwith your lover",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 32.w,
          bottom: 314.h,
          child: const HeaderText5(
            text: "Help us\nto improve the app",
          ),
        ),
        Positioned(
          left: 24.w,
          bottom: 258.h,
          child: const SubtitleText(
            text: "We constantly monitor reviews\nand listen to your opinion",
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFD5DC),
                          Color(0xFFFF9DAD),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/white_heart.svg",
                        width: 46.26.w,
                        height: 42.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 232.w,
                    height: 22.h,
                    child: const Text("Rate the app."),
                  ),
                  SizedBox(
                    width: 238.w,
                    height: 32.h,
                    child: const Text('Tap a star to rate. You can also leave a comment'),
                  ),
                ],
              ),
              Positioned(
                top: 189.h,
                left: 0,
                child: Container(
                  width: 270.w,
                  height: 40.5.h,
                  color: Colors.red,
                  child: Center(
                    child: Container(
                      width: 184.w,
                      height: 24.h,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/blue_star.svg'),
                          SvgPicture.asset('assets/icons/blue_star.svg'),
                          SvgPicture.asset('assets/icons/blue_star.svg'),
                          SvgPicture.asset('assets/icons/blue_star.svg'),
                          SvgPicture.asset('assets/icons/blue_star.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: const <Widget>[
            CupertinoDialogAction(
              child: Text("Cancel"),
            ),
            CupertinoDialogAction(
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }
}
