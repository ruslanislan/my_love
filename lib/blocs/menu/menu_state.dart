part of 'menu_bloc.dart';


abstract class MenuState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MenuItemsLoading extends MenuState{

}

class MenuItemsLoaded extends MenuState{
  final List<Menu> menuItems;

  MenuItemsLoaded(this.menuItems);
  @override
  List<Object?> get props => [menuItems];
}


