import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  static const List<String> customButtonTexts = [
    "First meet",
    "First date",
    "First kiss",
    "Proposal",
    "Marriage",
  ];

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
            CustomAppBar(
              text: "Customize",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EightHeightDivider(),
                    Column(
                      children: List.generate(
                        customButtonTexts.length,
                            (index) => Column(
                          children: [
                            CustomButton(
                              text: customButtonTexts[index],
                            ),
                            if (index != customButtonTexts.length - 1)
                              const EightHeightDivider(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
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