import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';
  static final sporttable='my_table_sport';

  static final title='title';
  static final url='url';
  static final content='content';
  static final publishedAt='publishedAt';
  static final description='description' ;
  static final urlToImage='urlToImage';
  static final author='author';
  static final col_id='id';


  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $col_id INTEGER PRIMARY KEY,
            $author TEXT NOT NULL,
            $title TEXT NOT NULL,
             $description TEXT NOT NULL,
            $url TEXT NOT NULL,
            $urlToImage TEXT NOT NULL,
             $publishedAt TEXT NOT NULL,
              $content TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $sporttable (
            $col_id INTEGER PRIMARY KEY,
            $author TEXT NOT NULL,
            $title TEXT NOT NULL,
             $description TEXT NOT NULL,
            $url TEXT NOT NULL,
            $urlToImage TEXT NOT NULL,
             $publishedAt TEXT NOT NULL,
              $content TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> insertsport(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(sporttable, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }




}
