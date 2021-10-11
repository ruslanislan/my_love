import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.onTap, this.selected = false}) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 43.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r),
          color: selected ? Colors.white : const Color(0xFF252525).withAlpha(80),
        ),
        child: Center(
          child: SizedBox(
            width: 295.w,
            height: 27.h,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return selected ? const LinearGradient(
                  colors: [
                    Color(0xFFFFBBC7),
                    Color(0xFFFF899D),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds) : const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
