import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_love/models/menu.dart';
import 'package:my_love/services/menu_service.dart';

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
      if(menu != null){
        await _menuService.update(menu.copyWith(image: imageData));
      }
      emit(MenuItemsLoading());
      final menuItems = await _menuService.getAll();
      emit(MenuItemsLoaded(menuItems));
    });
  }
}
