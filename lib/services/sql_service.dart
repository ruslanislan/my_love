import 'package:my_love/models/menu.dart';
import 'package:my_love/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlService {
  static final SqlService instance = SqlService._init();
  int t = 0;
  static Database? _database;

  SqlService._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    await _init();
    return _database!;
  }

  Future<void> _init() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, "my_love.db");

    _database = await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const uuidType = "TEXT PRIMARY KEY";
    const boolType = "BOOLEAN DEFAULT FALSE";
    const intType = "INTEGER";
    const textType = "TEXT";
    const timestampType = 'DATETIME DEFAULT CURRENT_TIMESTAMP';

    await db.execute('''
    CREATE TABLE $noteTable (
      ${NoteFields.id} $idType,
      ${NoteFields.name} $textType,
      ${NoteFields.date} $textType,
      ${NoteFields.content} $textType,
      ${NoteFields.createdAt} $textType,
      ${NoteFields.updatedAt} $textType
    );
    ''');
    await db.execute('''
    CREATE TABLE $menuTable (
      ${MenuFields.id} $idType,
      ${MenuFields.name} $textType,
      ${MenuFields.date} $textType,
      ${MenuFields.image} $textType,
      ${MenuFields.createdAt} $textType,
      ${MenuFields.updatedAt} $textType
    );
    ''');
  }

  Future<void> close() async {
    _database?.close();
  }
}
