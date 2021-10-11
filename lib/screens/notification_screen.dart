import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static const List<String> customButtonTexts = [
    "First meet",
    "First date",
    "First kiss",
    "Proposal",
    "Marriage",
  ];
  static const List<String> frequencyTexts = [
    "Month",
    "3 month",
    "6 month",
    "Year",
  ];
  int selected = -1;
  int frequencySelected = frequencyTexts.length - 1;
  bool enabled = false;
  final TextEditingController textEditingController = TextEditingController();
  int textLength = 0;
  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFBBC7), Color(0xFFFF899D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 44.h,
            ),
            const CustomAppBar(
              text: "Notifications",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const EightHeightDivider(),
                    Column(
                      children: List.generate(
                        customButtonTexts.length,
                        (index) => Column(
                          children: [
                            CustomButton(
                              text: customButtonTexts[index],
                              selected: selected == index,
                              onTap: () {
                                if (selected == index) {
                                  selected = -1;
                                  setState(() {});
                                } else {
                                  selected = index;
                                  setState(() {});
                                }
                              },
                            ),
                            if (index != customButtonTexts.length - 1) const EightHeightDivider(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (selected != -1)
                      Column(
                        children: [
                          Container(
                            width: 102.w,
                            height: 28.h,
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              color: const Color(0xFF252525).withAlpha(80),
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  top: 0,
                                  bottom: 0,
                                  left: enabled ? 51.w : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: GestureDetector(
                                    onTap: () {
                                      enabled = !enabled;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 47.w,
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24.r),
                                        color: Colors.white,
                                        gradient: enabled
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFFFFBBC7),
                                                  Color(0xFFFF899D),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 327.w,
                            height: 16.h,
                            child: Center(
                              child: Text(
                                "Frequency",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ),
                          const EightHeightDivider(),
                          Container(
                            height: 22.h,
                            margin: EdgeInsets.symmetric(
                              horizontal: 24.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                frequencyTexts.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    frequencySelected = index;
                                    setState(() {});
                                  },
                                  child: Text(
                                    frequencyTexts[index],
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: frequencySelected == index ? FontWeight.w500 : FontWeight.w100,
                                      color: frequencySelected == index ? Colors.white : const Color(0xFF252525).withAlpha(80),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 327.w,
                            height: 16.h,
                            child: Center(
                              child: Text(
                                "Time",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ),
                          const EightHeightDivider(),
                          Container(
                            width: 327.w,
                            height: 43.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF252525).withAlpha(80),
                              borderRadius: BorderRadius.circular(
                                17.r,
                              ),
                            ),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 295.w,
                                  height: 27.h,
                                  child: Text(
                                    editing ? "" : "Enter the time...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 295.w,
                                  height: 27.h,
                                  child: TextField(
                                    controller: textEditingController,
                                    onTap: () {
                                      editing = true;
                                    },
                                    onEditingComplete: () {
                                      if (textEditingController.text.isEmpty) {
                                        editing = false;
                                      }
                                      FocusScope.of(context).unfocus();
                                    },
                                    onChanged: (value) {
                                      if (value.length >= 5) {
                                        textEditingController.text = value.substring(0, 5);
                                        textEditingController.selection = TextSelection.fromPosition(
                                          TextPosition(offset: textEditingController.text.length),
                                        );
                                      } else if (value.length == 2 && textLength < value.length) {
                                        textEditingController.text += ":";
                                        textEditingController.selection = TextSelection.fromPosition(
                                          TextPosition(offset: textEditingController.text.length),
                                        );
                                      } else if (textLength > value.length && value.length == 2) {
                                        textEditingController.text = textEditingController.text.substring(0, 1);
                                        textEditingController.selection = TextSelection.fromPosition(
                                          TextPosition(offset: textEditingController.text.length),
                                        );
                                      }
                                      textLength = textEditingController.text.length;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const EightHeightDivider(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
