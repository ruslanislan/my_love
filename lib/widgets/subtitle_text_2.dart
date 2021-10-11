import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtitleText2 extends StatelessWidget {
  const SubtitleText2({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 183.w,
      height: 24.h,
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
