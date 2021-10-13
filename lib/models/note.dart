const String noteTable = 'note';

class NoteFields {
  static final List<String> values = [id, name, date, content, createdAt, updatedAt];
  static const String id = 'id';
  static const String name = 'name';
  static const String date = 'date';
  static const String content = 'content';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
}

class Note {
  final int? id;
  final String name;
  final String date;
  final String content;
  final String? createdAt;
  final String? updatedAt;

  Note({this.id, required this.name, required this.content, required this.date, this.createdAt, this.updatedAt});

  static Note fromJson(Map<String, Object?> json) =>
      Note(
        id: json[NoteFields.id] as int?,
        name: json[NoteFields.name] as String,
        date: json[NoteFields.date] as String,
        content: json[NoteFields.content] as String,
        createdAt: json[NoteFields.createdAt] as String?,
        updatedAt: json[NoteFields.updatedAt] as String?,
      );

  Map<String, Object?> toJson() =>
      {
        NoteFields.id: id,
        NoteFields.name: name,
        NoteFields.date: date,
        NoteFields.content: content,
        NoteFields.createdAt: createdAt,
        NoteFields.updatedAt: updatedAt,
      };

  Note copy({required int id}) =>
      Note(
        id: id,
        name: name,
        date: date,
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Note copyWith({int? id, String? name, String? date, String? content, String? createdAt, String? updatedAt}) =>
      Note(id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,);
}
