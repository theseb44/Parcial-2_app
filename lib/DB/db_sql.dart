import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:parcial2/product_class.dart';

export 'db_sql.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  final String tableName = 'productos';

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._internal();
    }
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final path = join('lib/DB/database', 'productos.db');

    final db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT,
        nombre TEXT,
        precioVenta REAL,
        descuento REAL
      )
    ''');
    });

    return db;
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert(tableName, product.toMap());
  }

 
  Future<List<Map<String, dynamic>>> getAllProducts() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(tableName);
  return maps;
}

  
  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(tableName, product.toMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }


  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
