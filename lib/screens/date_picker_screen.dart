import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_love/screens/completed_date_picker_screen.dart';
import 'package:my_love/widgets/body_text_2.dart';
import 'package:my_love/widgets/date_text_field_body.dart';
import 'package:my_love/widgets/header_text_6.dart';


class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({Key? key, required this.asset, required this.headerText}) : super(key: key);
  final String asset;
  final String headerText;
  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  final DateTime dateTime = DateTime.now();
  final TextEditingController textEditingController1 = TextEditingController(text: "0");

  final TextEditingController textEditingController2 = TextEditingController(text: "0");

  final TextEditingController textEditingController3 = TextEditingController(text: "0");

  final TextEditingController textEditingController4 = TextEditingController(text: "0");

  final TextEditingController textEditingController5 = TextEditingController(text: "0");

  final TextEditingController textEditingController6 = TextEditingController(text: "0");

  final TextEditingController textEditingController7 = TextEditingController(text: "0");

  final TextEditingController textEditingController8 = TextEditingController(text: "0");

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    final days = DateFormat("d").format(dateTime).toString();
    final months = DateFormat("M").format(dateTime).toString();
    final years = DateFormat("y").format(dateTime).toString();
    if (days.length > 1) {
      textEditingController1.text = days[0];
      textEditingController2.text = days[1];
    } else {
      textEditingController2.text = days[0];
    }
    if (months.length > 1) {
      textEditingController3.text = months[0];
      textEditingController4.text = months[1];
    } else {
      textEditingController4.text = months[0];
    }

    textEditingController5.text = years[0];
    textEditingController6.text = years[1];
    textEditingController7.text = years[2];
    textEditingController8.text = years[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFBBC7), Color(0xFFFF899D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 24.w,
              top: 308.h,
              child: HeaderText6(
                text: widget.headerText,
                height: 24.w,
              ),
            ),
            Positioned(
              top: 348.h,
              left: 48.w,
              child: Container(
                width: 279.w,
                height: 110.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFF252525).withAlpha(80),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 16.h, bottom: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 16.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 52.w,
                              child: const Center(
                                child: BodyText2(
                                  text: "Day",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 52.w,
                              child: const Center(
                                child: BodyText2(text: "Month"),
                              ),
                            ),
                            SizedBox(
                              width: 106.w,
                              child: const Center(
                                child: BodyText2(text: "Year"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 52.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DateTextFieldBody(
                                    first: true,
                                    textEditingController: textEditingController1,
                                  ),
                                  DateTextFieldBody(
                                    textEditingController: textEditingController2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 52.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DateTextFieldBody(
                                    textEditingController: textEditingController3,
                                  ),
                                  DateTextFieldBody(
                                    textEditingController: textEditingController4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 106.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DateTextFieldBody(
                                    textEditingController: textEditingController5,
                                  ),
                                  DateTextFieldBody(
                                    textEditingController: textEditingController6,
                                  ),
                                  DateTextFieldBody(
                                    textEditingController: textEditingController7,
                                  ),
                                  DateTextFieldBody(
                                    last: true,
                                    textEditingController: textEditingController8,
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
                  final String date = textEditingController1.text +
                      textEditingController2.text +
                      "." +
                      textEditingController3.text +
                      textEditingController4.text +
                      "." +
                      textEditingController5.text +
                      textEditingController6.text +
                      textEditingController7.text +
                      textEditingController8.text;
                  final DateFormat format = DateFormat("dd.MM.yyyy");

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompletedDatePickerScreen(
                        asset: widget.asset,
                        dateTime: format.parse(date),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xFFFFBBC7),
                          Color(0xFFFF899D),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Center(
                      child: Text(
                        "ok".toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
