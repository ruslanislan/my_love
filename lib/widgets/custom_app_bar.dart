import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.onTap, required this.text, this.offBackButton = false}) : super(key: key);
  final VoidCallback? onTap;
  final String text;
  final bool offBackButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 56.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if(!offBackButton) {
                Navigator.pop(context);
              }
            },
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(
                "assets/icons/arrow.svg",
              ),
            ),
          ),
          SizedBox(
            width: 215.w,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GestureDetector(
onTap: onTap,
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: onTap != null ? SvgPicture.asset(
                'assets/icons/add.svg',
              ) : null,
            ),
          ),
        ],
      ),
    );
  }
}
