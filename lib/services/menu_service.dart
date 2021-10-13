import 'package:my_love/models/menu.dart';
import 'package:my_love/services/local_service.dart';

class MenuService extends LocalService<Menu>{
  @override
  Menu copy(Menu model, int id) {
    return model.copy(id: id);
  }

  @override
  Menu deserialize(Map<String, Object?> json) {
    return Menu.fromJson(json);
  }

  @override
  List<Menu> deserializeList(List<Map<String, Object?>> result) {
    return result.map((e) => Menu.fromJson(e)).toList();
  }

  @override
  String get fieldId => MenuFields.id;

  @override
  List<String> get fieldList => MenuFields.values;

  @override
  int modelId(Menu model) {
    return model.id!;
  }

  @override
  String get orderBy => '${MenuFields.updatedAt} ASC';

  @override
  Map<String, Object?> serialize(Menu model) {
    return model.toJson();
  }

  @override
  String get tableName => menuTable;

  @override
  String get fieldName => MenuFields.name;

}