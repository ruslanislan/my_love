part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMenuItems extends MenuEvent {}

class UpdateMenuItems extends MenuEvent {
  final String name;
  final String date;

  UpdateMenuItems(this.name, this.date);
}

class LoadImage extends MenuEvent {
  final String name;
  final Uint8List imageData;

  LoadImage(this.name, this.imageData);
}

class SaveNotification extends MenuEvent {
  final Menu menu;

  SaveNotification({
    required this.menu,
  });
}
