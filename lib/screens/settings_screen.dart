import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/screens/customize_screen.dart';
import 'package:my_love/screens/onboarding_screens/onboarding_screen_6.dart';
import 'package:my_love/services/preferences_provider.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:share/share.dart';

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
            const CustomAppBar(
              text: "Settings",
            ),
            Expanded(
              child: Column(
                children: [
                  const CustomButton(
                    text: "Set to zero",
                  ),
                  const EightHeightDivider(),
                  CustomButton(
                    text: "Customize",
                    onTap: () async {
                      final bool isPaid = await PreferencesProvider().isPaid();
                      if (isPaid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CustomizeScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OnboardingScreen6(
                              onTap: () {},
                              onCloseTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const EightHeightDivider(),
                  CustomButton(
                    text: "Share",
                    onTap: () {
                      print('SettingsScreen.build');
                      shareApp( context);
                    },
                  ),
                  const EightHeightDivider(),
                  const CustomButton(
                    text: "Privacy policy",
                  ),
                  const EightHeightDivider(),
                  const CustomButton(
                    text: "Term of use",
                  ),
                  const EightHeightDivider(),
                  const CustomButton(
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

  void shareApp( BuildContext context) async {
    String appLink = 'My Love Relationship Count';
    final RenderBox box = context.findRenderObject() as RenderBox;

    await Share.share(appLink, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
