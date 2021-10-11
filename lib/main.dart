import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/screens/menu_screen.dart';
import 'package:my_love/screens/onboarding_screen.dart';
import 'package:my_love/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Rubik",
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
              fontWeight: FontWeight.w700,
            ),
            headline5: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.w300,
              height: 1,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
            subtitle2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            )
          ),
        ),
        home: const SplashScreen(),
        routes: {
          "menu_screen":(_)=> const MenuScreen(),
          "onboarding_screen":(_)=> OnboardingScreen()
        },
      ),
    ),
  );
}
