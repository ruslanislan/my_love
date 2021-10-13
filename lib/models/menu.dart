const String menuTable = 'menu';

class MenuFields {
  static final List<String> values = [id, name, date, image, createdAt, updatedAt];
  static const String id = 'id';
  static const String name = 'name';
  static const String date = 'date';
  static const String image = 'image';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
}

class Menu {
  final int? id;
  final String name;
  final String date;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  Menu({this.id, required this.name, this.image, required this.date, this.createdAt, this.updatedAt});

  static Menu fromJson(Map<String, Object?> json) => Menu(
        id: json[MenuFields.id] as int?,
        name: json[MenuFields.name] as String,
        date: json[MenuFields.date] as String,
        image: json[MenuFields.image] as String?,
        createdAt: json[MenuFields.createdAt] as String?,
        updatedAt: json[MenuFields.updatedAt] as String?,
      );

  Map<String, Object?> toJson() => {
        MenuFields.id: id,
        MenuFields.name: name,
        MenuFields.date: date,
        MenuFields.image: image,
        MenuFields.createdAt: createdAt,
        MenuFields.updatedAt: updatedAt,
      };

  Menu copy({required int id}) => Menu(
        id: id,
        name: name,
        date: date,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Menu copyWith({int? id, String? name, String? date, String? image, String? createdAt, String? updatedAt}) {
    return Menu(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
