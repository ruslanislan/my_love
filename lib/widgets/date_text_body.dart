import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTextBody extends StatelessWidget {
  const DateTextBody({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 48.h,
      color: Colors.white,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1B1A1A),
          ),
        ),
      ),
    );
  }
}
