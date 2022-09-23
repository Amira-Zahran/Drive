import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<Database> initDb() async {
    return sql.openDatabase(
      'odc.db', //Database Name
      version: 1, //Version Number
      onCreate: (Database database, int version) async {
        await createTableNote(database);
      },
    );
  }

  static Future<void> createTableNote(Database database) async {
    await database.execute("""CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        Date TEXT,
        descriptionNote TEXT
      )
      """);

    debugPrint("table Created");
  }

  //add
  static Future<int> addNote(
      String? title, String? descrption, String? Date) async {
    final db = await SQLHelper.initDb(); //open database
    final data = {
      'title': title,
      'descriptionNote': descrption,
      'Date': Date
    }; //Create data in map
    final id = await db.insert('notes', data); //Insert
    debugPrint("Data Added");
    return id;
  }

//Read all Plants
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SQLHelper.initDb();
    return db.query('notes', orderBy: "id");
  }

  //Get plant by ID
  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await SQLHelper.initDb();
    return db.query('notes', where: "id = ?", whereArgs: [id]);
  }

  //update
  static Future<int> updateNote(
      int id, String? title, String? descrption, String? Date) async {
    final db = await SQLHelper.initDb();
    final data = {
      'title': title,
      'Date': Date,
      'description': descrption,
    };

    final result =
    await db.update('notes', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteNote(int id) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("notes", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when : $err");
    }
  }
}
