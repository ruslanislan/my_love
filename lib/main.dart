import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/blocs/menu/menu_bloc.dart';
import 'package:my_love/blocs/note/note_bloc.dart';
import 'package:my_love/screens/notification_screen.dart';
import 'package:my_love/screens/splash_screen.dart';
import 'package:my_love/services/menu_service.dart';
import 'package:my_love/services/note_service.dart';
import 'package:my_love/services/notification_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MenuService _menuService = MenuService();

  final NoteService _noteService = NoteService();

  @override
  void initState() {
    listenNotification();
    super.initState();
  }

  void listenNotification() {
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? event) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Container(),),);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
          MenuBloc(_menuService)
            ..add(
              LoadMenuItems(),
            ),
        ),
        BlocProvider(
          create: (_) =>
          NoteBloc(_noteService)
            ..add(
              LoadNotes(),
            ),
        ),
      ],
      child: MaterialApp(
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
                //color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w300,
                height: 1,
              ),
              subtitle1: TextStyle(
                //color: Colors.white,
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
              )),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
