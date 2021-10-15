import 'package:my_love/services/sql_service.dart';
import 'package:sqflite/sqflite.dart';


abstract class LocalService<T> {
  SqlService sqlService = SqlService.instance;

  Future<void> create(T model) async {
    final Database db = await sqlService.database;
    await db.insert(tableName, serialize(model));
  }

  Future<T?> getOne(int id) async {
    final db = await sqlService.database;
    final maps = await db.query(tableName,
        columns: fieldList, where: '$fieldId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return deserialize(maps.first);
    }
    return null;
  }

  Future<T?> getByName(String name) async {
    final db = await sqlService.database;
    final maps = await db.query(tableName, columns: fieldList, where: '$fieldName = ?', whereArgs: [name]);
    if(maps.isNotEmpty){
      return deserialize(maps.first);
    }
    return null;
  }

  Future<List<T>> getAll() async {
    final Database db = await sqlService.database;
    final result = await db.query(tableName, orderBy: orderBy);
    if(result.isNotEmpty) {
      return deserializeList(result);
    }
    return [];
  }

  Future<void> update(T model) async {
    final Database db = await sqlService.database;
    db.update(
      tableName,
      serialize(model),
      where: '$fieldId = ?',
      whereArgs: [modelId(model)],
    );
  }

  Future<void> delete(int id) async {
    final Database db = await sqlService.database;
    await db.delete(tableName, where: '$fieldId = ?', whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    final Database db = await sqlService.database;
    await db.delete(tableName);
  }

  Future<void> close() async {
    sqlService.close();
  }

  Map<String, Object?> serialize(T model);

  T deserialize(Map<String, Object?> json);

  List<T> deserializeList(List<Map<String, Object?>> result);

  T copy(T model, int id);

  int modelId(T model);

  List<String> get fieldList;

  String get fieldId;

  String get tableName;

  String get orderBy;

  String get fieldName;
}
