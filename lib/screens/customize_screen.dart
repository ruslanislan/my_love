import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_love/blocs/menu/menu_bloc.dart';
import 'package:my_love/constants/menu_items.dart';
import 'package:my_love/models/menu.dart';
import 'package:my_love/services/menu_service.dart';
import 'package:my_love/widgets/custom_app_bar.dart';
import 'package:my_love/widgets/custom_button.dart';
import 'package:my_love/widgets/eight_height_divider.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomizeScreen extends StatelessWidget {
  CustomizeScreen({Key? key}) : super(key: key);

  final ImagePicker _imagePicker = ImagePicker();
  final MenuService _menuService = MenuService();
  XFile? image;

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
              text: "Customize",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const EightHeightDivider(),
                    Column(
                      children: List.generate(
                        menuItems.length,
                        (index) => Column(
                          children: [
                            CustomButton(
                              text: menuItems[index],
                              onTap: () async {
                                final Menu? menu = await _menuService.getByName(menuItems[index]);
                                if (menu != null && await Permission.photos.request().isGranted) {
                                  try {
                                    image = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                                    if (image == null) {
                                      return;
                                    }

                                    final Uint8List data = await image!.readAsBytes();

                                    BlocProvider.of<MenuBloc>(context).add(LoadImage(menuItems[index], data));
                                  } on PlatformException catch (e) {
                                    print('Failed to pick image: $e');
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("before installing the image, set the date!"),
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
