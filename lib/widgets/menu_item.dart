import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_love/models/menu.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.asset,
    this.onTap,
    required this.text,
    this.menu,
  }) : super(key: key);
  final String asset;
  final VoidCallback? onTap;
  final String text;
  final Menu? menu;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateFormat("dd.MM.yyyy").parse(menu?.date ?? '02.12.1999');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 148.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
        child: Stack(
          children: [
            menu?.image != null
                ? Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      child: Image.memory(
                        base64Decode(menu!.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      child: Image.asset(
                        asset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Center(
              child: Container(
                width: 327.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF252525).withAlpha(80),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (menu?.date != null)
                      SizedBox(
                        height: 4.h,
                      ),
                    if (menu?.date != null)
                      Text(
                        DateFormat("dd MMM yyyy").format(dateTime),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              height: 1,
                            ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
