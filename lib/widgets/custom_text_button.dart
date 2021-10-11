import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "3 month",
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
        color: const Color(0xFF252525).withAlpha(80),
      ),
    );
  }
}
