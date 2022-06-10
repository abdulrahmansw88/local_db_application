import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  DatabaseHelper._createInstance();
  static DatabaseHelper? _databaseHelper;    // Singleton DatabaseHelper
  static Database? _database;                // Singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';


  factory DatabaseHelper() {
    print("Database helper called");
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    print("Path :  $path");
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    log("Table created");
    // User table
    await db.execute(
        'CREATE TABLE user($colId INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, '
            'email TEXT UNIQUE, city TEXT, $colDate TEXT)');
    // Books Table
    await db.execute('CREATE TABLE book($colId INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, '
        'book_name TEXT, author_name TEXT, $colDate TEXT)');
  }


   Future insertUser(String name, String? email, int? priority) async {
    Database db = await database;
    Map<String, dynamic> data = {
      "name" : name,
      "email" : email,
      "city" : '',
      colDate : DateTime.now().toIso8601String(),
    };
    try{
     await db.insert('user', data);
    log('User INSERTED SUCCESS FULLY');
    }catch(e){
      log('User not INSERTED !!  \n $e');
    }
  }

  Future insertBook(int? userID, String name, String? date) async {
    Database db = await database;
    Map<String, dynamic> data = {
      "user_id" : userID,
      "book_name" : name,
      "author_name" : '',
      colDate : date,
    };
    try{
    await db.insert('book', data);
    log('Book INSERTED SUCCESS FULLY');
    }catch(e){
      log('Book not INSERTED !! \n $e');
    }
  }

  Future<int> getIDFromName(String name)async{
    Database db = await database;
    String querryString = 'SELECT id FROM user WHERE name == ' +  '"$name"';
   var id = await db.rawQuery(querryString);
   log("${id[0]['id']}");
    var val = id[0]['id'];
   int a = await int.parse("$val");
   return a;
  }

  Future query(String? query) async{
    Database db = await database;
    var data = await db.rawQuery(query!);
    log('Record ${data.length}');
    List.generate(data.length, (index)  {
      print("Record $index \n");
      print(data[index]);
    });
    return data;
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    List.generate(result.length, (index) {
      log('${result[index] }\n');
    });

    log("${result.length} database table items available");
    return result;
  }


}