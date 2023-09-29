import 'package:flutter_mochammadagatha/models/db_manager.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _database;

// Future<void> open() async {
//   final databasePath = await getDatabasesPath();
//   final dbPath = path.join(databasePath, 'contacts.db');

//   _database = await openDatabase(
//     dbPath,
//     version: 1,
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, phoneNumber TEXT, date TEXT, color TEXT, fileName TEXT)',
//       );
//     },
//   );
// }
  Future<Database> getDatabase() async {
    if (_database.isOpen) {
      return _database;
    } else {
      _database = await open();
      return _database;
    }
  }

  Future<void> insertContact(Contact contact) async {
    await _database.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Database> open() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, 'contacts.db');

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, phoneNumber TEXT, date TEXT, color TEXT, fileName TEXT)',
        );
      },
    );

    return _database;
  }

  Future<List<Contact>> getContacts() async {
    final List<Map<String, dynamic>> maps = await _database.query('contacts');
    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phoneNumber: maps[i]['phoneNumber'],
        date: maps[i]['date'],
        color: maps[i]['color'],
        fileName: maps[i]['fileName'],
      );
    });
  }

  Future<void> updateContact(Contact contact) async {
    await _database.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await getDatabase();
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
