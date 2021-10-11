import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const List<String> settingButtonTexts = [
    "Set to zero",
    "Customize",
    "Share",
    "Privacy policy",
    "Term of use",
    "Support",
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
              text: "Settings",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EightHeightDivider(),
                    Column(
                      children: List.generate(
                        settingButtonTexts.length,
                        (index) => Column(
                          children: [
                            CustomButton(
                              text: settingButtonTexts[index],
                            ),
                            if (index != settingButtonTexts.length - 1)
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
