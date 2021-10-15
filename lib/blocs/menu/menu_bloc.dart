import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:my_love/models/menu.dart';
import 'package:my_love/services/menu_service.dart';
import 'package:my_love/services/notification_api.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuService _menuService;
  MenuBloc(this._menuService) : super(MenuItemsLoading()) {
    on<LoadMenuItems>((event, emit) async {
      emit(MenuItemsLoading());
      final List<Menu> list = await _menuService.getAll();
      emit(MenuItemsLoaded(list));
    });
    on<UpdateMenuItems>((event, emit) async {
      emit(MenuItemsLoading());
      final Menu? temp = await _menuService.getByName(event.name);
      if (temp == null) {
        final Menu menu = Menu(name: event.name, date: event.date, createdAt: DateTime.now().toString(), updatedAt: DateTime.now().toString());
        await _menuService.create(menu);
      } else {
        await _menuService.update(temp.copyWith(updatedAt: DateTime.now().toIso8601String(), date: event.date));
      }
      final menuItems = await _menuService.getAll();
      emit(MenuItemsLoaded(menuItems));
    });
    on<LoadImage>((event, emit) async {
      final String imageData = base64Encode(event.imageData);
      final Menu? menu = await _menuService.getByName(event.name);
      if (menu != null) {
        await _menuService.update(menu.copyWith(image: imageData));
      }
      emit(MenuItemsLoading());
      final menuItems = await _menuService.getAll();
      emit(MenuItemsLoaded(menuItems));
    });
    on<SaveNotification>((event, emit) async {
      tz.initializeTimeZones();
      await _menuService.update(
      event.menu,
      );

      if (event.menu.active == 1 && event.menu.time != null && event.menu.time!.isNotEmpty) {
        NotificationApi.showScheduleNotification(
          id: event.menu.id!,
          title: event.menu.name,
          body: event.menu.frequency.toString(),
          payload: "payload",
          scheduledDate: tz.TZDateTime(
            tz.local,
            DateFormat("dd.MM.yyyy").parse(event.menu.date).year,
            DateFormat("dd.MM.yyyy").parse(event.menu.date).month,
            DateFormat("dd.MM.yyyy").parse(event.menu.date).day,
            DateFormat.Hm().parse(event.menu.time!).hour,
            DateFormat.Hm().parse(event.menu.time!).minute,
          ),
          frequency: event.menu.frequency!,
        );
      } else{
        NotificationApi.cancel(event.menu.id!);
      }
      NotificationApi.showPendingNotifications();
      emit(MenuItemsLoading());
      final menuItems = await _menuService.getAll();
      emit(MenuItemsLoaded(menuItems));
    });
  }
}
