import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_love/models/menu.dart';
import 'package:my_love/widgets/body_text_2.dart';
import 'package:my_love/widgets/date_text_body.dart';

class CompletedDatePickerScreen extends StatefulWidget {
  const CompletedDatePickerScreen({Key? key, required this.asset, this.dateTime, this.menu}) : super(key: key);
  final String asset;
  final DateTime? dateTime;
  final Menu? menu;

  @override
  _CompletedDatePickerScreenState createState() => _CompletedDatePickerScreenState();
}

class _CompletedDatePickerScreenState extends State<CompletedDatePickerScreen> {
  late String diffDays;
  late String diffHours;
  late String diffMinutes;
  late String diffSeconds;
  late Timer timer;
  Uint8List? imageData;
  late int milliseconds1;
  bool loaded = false;

  @override
  void initState() {
    init();
    passedTimeCalculate();
    super.initState();
  }

  Future<void> init() async {
    if (widget.dateTime != null) {
      milliseconds1 = widget.dateTime!.millisecondsSinceEpoch;
      loaded = true;
    }
    if (widget.menu != null) {
      milliseconds1 = DateFormat("dd.MM.yyyy").parse(widget.menu!.date).millisecondsSinceEpoch;
      if (widget.menu?.image != null) {
        imageData = base64Decode(widget.menu!.image!);
        loaded = true;
      } else {
        loaded = true;
      }
    }
  }

  Future<void> passedTimeCalculate() async {
    int milliseconds2 = DateTime.now().millisecondsSinceEpoch;
    int diff = milliseconds2 - milliseconds1;
    diffDays = "0000" + (diff ~/ (24 * 60 * 60 * 1000)).toString();
    diff = diff % (24 * 60 * 60 * 1000);
    diffHours = "00" + (diff ~/ (60 * 60 * 1000)).toString();
    diff = diff % (60 * 60 * 1000);
    diffMinutes = "00" + (diff ~/ (60 * 1000)).toString();
    diff = diff % (60 * 1000);
    diffSeconds = "00" + (diff ~/ 1000).toString();
    timer = Timer(const Duration(seconds: 1), () {
      passedTimeCalculate();
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !loaded
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                widget.menu?.image != null
                    ? Positioned.fill(
                        child: Image.memory(
                          imageData!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Positioned.fill(
                        child: Image.asset(
                          widget.asset,
                          fit: BoxFit.cover,
                        ),
                      ),
                Positioned(
                  top: 348.h,
                  left: 24.w,
                  child: Container(
                    width: 327.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: const Color(0xFF252525).withAlpha(80),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h, bottom: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 16.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 106.w,
                                  child: const Center(
                                    child: BodyText2(
                                      text: "Days",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: const Center(
                                    child: BodyText2(
                                      text: "Hours",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: const Center(
                                    child: BodyText2(
                                      text: "Mins",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: const Center(
                                    child: BodyText2(
                                      text: "Secs",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 106.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DateTextBody(
                                        text: diffDays[diffDays.length - 4],
                                      ),
                                      DateTextBody(
                                        text: diffDays[diffDays.length - 3],
                                      ),
                                      DateTextBody(
                                        text: diffDays[diffDays.length - 2],
                                      ),
                                      DateTextBody(
                                        text: diffDays[diffDays.length - 1],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DateTextBody(
                                        text: diffHours[diffHours.length - 2],
                                      ),
                                      DateTextBody(
                                        text: diffHours[diffHours.length - 1],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DateTextBody(
                                        text: diffMinutes[diffMinutes.length - 2],
                                      ),
                                      DateTextBody(
                                        text: diffMinutes[diffMinutes.length - 1],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 52.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DateTextBody(
                                        text: diffSeconds[diffSeconds.length - 2],
                                      ),
                                      DateTextBody(
                                        text: diffSeconds[diffSeconds.length - 1],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 666.h,
                  left: 152.5.w,
                  child: GestureDetector(
                    onTap: () {
                      timer.cancel();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFBBC7),
                            Color(0xFFFF899D),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 32.w,
                          height: 32.h,
                          child: SvgPicture.asset(
                            "assets/icons/app.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
