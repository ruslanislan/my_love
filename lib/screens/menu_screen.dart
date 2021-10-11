import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_love/screens/date_picker_screen.dart';
import 'package:my_love/screens/note_screen.dart';
import 'package:my_love/widgets/custom_app_bar.dart';

import 'notification_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            SizedBox(
              height: 44.h,
            ),
            const CustomAppBar(text: "Menu"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem(
                      text: 'First meet',
                      asset: "assets/png/first_meet.png",
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const DatePickerScreen(
                              asset: "assets/png/first_meet2.png",
                              headerText: 'Set the date',
                            ),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 650,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem(
                      text: 'First date',
                      asset: 'assets/png/first_date.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const DatePickerScreen(
                              asset: "assets/png/first_date2.png",
                              headerText: 'Set the date',
                            ),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 650,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem(
                      text: 'First kiss',
                      asset: 'assets/png/first_kiss.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const DatePickerScreen(
                              asset: "assets/png/first_kiss2.png",
                              headerText: 'Set the date',
                            ),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 650,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem(
                      text: 'Proposal',
                      asset: 'assets/png/proposal.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const DatePickerScreen(
                              asset: "assets/png/proposal2.png",
                              headerText: 'Set the date',
                            ),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 650,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem(
                      text: 'Marriage',
                      asset: 'assets/png/marriage.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const DatePickerScreen(
                              asset: "assets/png/marriage2.png",
                              headerText: 'Set the date',
                            ),
                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 650,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    _MenuItem2(
                      text: "Notes",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NoteScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _MenuItem2(
                      text: "Notifications",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NotificationScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const _MenuItem2(
                      text: "Settings",
                    ),
                    SizedBox(
                      height: 42.h,
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

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    Key? key,
    required this.asset,
    this.onTap,
    required this.text,
  }) : super(key: key);
  final String asset;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 148.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          image: DecorationImage(
              image: AssetImage(
                asset,
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            width: 327.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: const Color(0xFF252525).withAlpha(80),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem2 extends StatelessWidget {
  const _MenuItem2({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 110.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          color: const Color(0xFF252525).withAlpha(80),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
