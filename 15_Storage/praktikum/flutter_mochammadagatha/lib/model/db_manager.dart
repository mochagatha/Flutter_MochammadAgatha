import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database?> initDatabase() async {
    try {
      var db = await openDatabase(
        join(await getDatabasesPath(), 'contact_db.db'),
        onCreate: (db, version) async {
          await db.execute(
            '''
          CREATE TABLE contacts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            nomor TEXT,
            date TEXT,
            color TEXT,
            file TEXT
          )
          ''',
          );
        },
        version: 1,
      );
      return db;
    } catch (e) {
      ('$e');
      return null;
    }
  }

  Future<void> insertContact(ModelContact contact) async {
    final database = await this.database;

    await database.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ModelContact>> getContacts() async {
    final database = await this.database;

    final List<Map<String, dynamic>> maps = await database.query('contacts');

    return List.generate(maps.length, (i) {
      return ModelContact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        nomor: maps[i]['nomor'],
        date: maps[i]['date'],
        color: maps[i]['color'],
        file: maps[i]['file'],
      );
    });
  }

  Future<void> updateContact(ModelContact contact) async {
    final database = await this.database;
    await database.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
