import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTextFieldBody extends StatelessWidget {
  const DateTextFieldBody({Key? key, this.first = false, this.last = false, required this.textEditingController}) : super(key: key);
  final TextEditingController textEditingController;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 48.h,
      color: Colors.white,
      child: TextField(
        //autofocus: true,
        onChanged: (value) {
          if (value.length > 1) {
            textEditingController.text = value[value.length - 1];
            FocusScope.of(context).nextFocus();
          } else if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: textEditingController,
        enabled: true,
        obscureText: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        showCursor: false,
        decoration: const InputDecoration(border: InputBorder.none),
        style: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1B1A1A),
        ),
      ),
    );
  }
}
