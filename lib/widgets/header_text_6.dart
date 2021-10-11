import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderText6 extends StatelessWidget {
  const HeaderText6({Key? key, required this.text, this.height}) : super(key: key);
  final String text;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: height ?? 40.h,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }
}
