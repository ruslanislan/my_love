import 'package:my_love/models/menu.dart';
import 'package:my_love/models/note.dart';

import 'local_service.dart';

class NoteService extends LocalService<Note> {
  @override
  serialize(Note model) {
    return model.toJson();
  }

  @override
  Note copy(Note model, int id) {
    return model.copy(id: id);
  }

  @override
  String get tableName => noteTable;

  @override
  String get fieldId => NoteFields.id;

  @override
  List<String> get fieldList => NoteFields.values;

  @override
  Note deserialize(Map<String, Object?> json) {
    return Note.fromJson(json);
  }

  @override
  String get orderBy => '${NoteFields.updatedAt} ASC';

  @override
  List<Note> deserializeList(List<Map<String, Object?>> result) {
    return result.map((e) => Note.fromJson(e)).toList();
  }

  @override
  int modelId(Note model) {
    return model.id!;
  }

  @override
  String get fieldName => MenuFields.name;
}

