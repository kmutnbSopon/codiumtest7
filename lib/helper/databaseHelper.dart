import 'dart:io';
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:codiumtest7/model/profileModel.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  String profileTable = 'profile_table';
  String colId = 'id';
  String colName = 'title';
  String colEmail = 'email';
  String colDate = 'date';
  String colAdress = 'address';
  String colStatus = 'status';

  //Profile table
  // Id | Name |  Email |     Date     |    Adress   | Status
  //  0     ''     ''          ''             ''         0
  //  1     ''     ''          ''             ''         0
  //  2     ''     ''          ''             ''         0
  //  3     ''     ''          ''             ''         0

  Future<Database> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'profile.db';
    final todoListDb = await openDatabase(path,version:1,onCreate:_createDb);
    return todoListDb;

  }

  void _createDb(Database db,int version) async {
    await db.execute('CREATE TABLE $profileTable($colId INTEGER PRIMARY KEY AUTOINCREMENT , $colName TEXT, $colEmail TEXT ,$colDate TEXT, $colAdress TEXT, $colStatus INTERGER)',);
  }

  Future<List<Map<String,dynamic>>> getTaskMapList() async {
    Database db = await this.db;
    final List<Map<String,dynamic>> result = await db.query(profileTable);
    return result;
  }

  Future<List<ProfileModel>> getProfileList() async{
    final List<Map<String,dynamic>> taskMapList = await getTaskMapList();
    final List<ProfileModel> taskList = [];
    taskMapList.forEach((taskMap){
      taskList.add(ProfileModel.fromMap(taskMap));
    });
    // taskList.sort((taskA,taskB) => taskA.date.compareTo(taskB.date));
    return taskList;
  }

  // Future<int> insertTask (ProfileModel profile) async{
  //   Database db = await this.db;
  //   final int result = await db.insert(profileTable,profile.toMap());
  //   return result;
  // }

  Future<int> updateProfile(ProfileModel task) async{
    Database db = await this.db;
    final int result = await db.update(
      profileTable,
      task.toMap(),
      where: '$colId = ?',
      whereArgs:[task.id],
    );
    return result;
  }

  Future<int> insertProfile (ProfileModel profile) async{
    Database db = await this.db;
    final int result = await db.insert(profileTable,profile.toMap());
    return result;
  }

  // insertProfile (ProfileModel profileModel) async {
  //   final db = await this.db;
  //   var res = await db.rawInsert(
  //     "INSERT Into profileTable (id,name,email,date,address,status)"
  //     " VALUES (${newClient.id},${newClient.firstName})");
  //   return res;
  // }

}