import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_love/screens/customize_screen.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  CustomButton(
                    text: "Set to zero",
                  ),
                  EightHeightDivider(),
                  CustomButton(
                    text: "Customize",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CustomizeScreen(),
                        ),
                      );
                    },
                  ),
                  EightHeightDivider(),
                  CustomButton(
                    text: "Share",
                  ),
                  EightHeightDivider(),
                  CustomButton(
                    text: "Privacy policy",
                  ),
                  EightHeightDivider(),
                  CustomButton(
                    text: "Term of use",
                  ),
                  EightHeightDivider(),
                  CustomButton(
                    text: "Support",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
