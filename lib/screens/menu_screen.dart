import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_love/blocs/menu/menu_bloc.dart';
import 'package:my_love/constants/menu_items.dart';
import 'package:my_love/models/menu.dart';
import 'package:my_love/screens/completed_date_picker_screen.dart';
import 'package:my_love/screens/date_picker_screen.dart';
import 'package:my_love/screens/note_screen.dart';
import 'package:my_love/screens/onboarding_screens/onboarding_screen_6.dart';
import 'package:my_love/screens/settings_screen.dart';
import 'package:my_love/services/preferences_provider.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:my_love/widgets/menu_item.dart';

import 'notification_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const List<String> _assets = [
    "assets/png/first_meet",
    'assets/png/first_date',
    'assets/png/first_kiss',
    'assets/png/proposal',
    'assets/png/marriage',
  ];

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
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenuItemsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MenuItemsError) {
              return Center(
                child: Text(
                  state.error,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              );
            }
            final List<Menu> list = (state as MenuItemsLoaded).menuItems;
            return Column(
              children: [
                SizedBox(
                  height: 44.h,
                ),
                const CustomAppBar(
                  offBackButton: true,
                  text: "Menu",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Column(
                          children: List.generate(
                            menuItems.length,
                            (index) => Column(
                              children: [
                                MenuItem(
                                  menu:
                                      list.where((element) => element.name == menuItems[index]).isNotEmpty ? list.where((element) => element.name == menuItems[index]).first : null,
                                  text: menuItems[index],
                                  asset: "${_assets[index]}.png",
                                  onTap: () {
                                    if (list.where((element) => element.name == menuItems[index] && element.date.isNotEmpty).isNotEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => CompletedDatePickerScreen(
                                            asset: "${_assets[index]}2.png",
                                            menu: list.where((element) => element.name == menuItems[index]).first,
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) => DatePickerScreen(
                                            menu: list.where((element) => element.name == menuItems[index]).isNotEmpty
                                                ? list.where((element) => element.name == menuItems[index]).first
                                                : null,
                                            name: menuItems[index],
                                            asset: "${_assets[index]}2.png",
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
                                    }
                                  },
                                ),
                                if (index != menuItems.length - 1) const EightHeightDivider(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        _MenuItem2(
                          text: "Notes",
                          onTap: () async {
                            final bool isPaid = await PreferencesProvider().isPaid();
                            if (isPaid) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NoteScreen(),
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
                        SizedBox(
                          height: 8.h,
                        ),
                        _MenuItem2(
                          text: "Notifications",
                          onTap: () async {
                            final bool isPaid = await PreferencesProvider().isPaid();
                            if (isPaid) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NotificationScreen(),
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
                        SizedBox(
                          height: 8.h,
                        ),
                        _MenuItem2(
                          text: "Settings",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
                          },
                        ),
                        SizedBox(
                          height: 42.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
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
