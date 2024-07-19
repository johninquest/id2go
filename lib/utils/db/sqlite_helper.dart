import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'sql_table_schema.dart';
/* import '/utils/date_time_helper.dart';
import 'data_model.dart'; */
import 'dart:io';
import 'dart:async';
//import 'dart:developer';

class DatabaseHelper {
  final String dbName = 'pockid.db';
  int dbVersion = 1;
  // final dateTimeNow = DateTimeHelper().timestampForDB() ?? '';

  Future<Database> initializeSQLiteDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, dbName);
    var dbOpened = await openDatabase(dbPath, onCreate: (db, version) async {
      // Enable foreign key support
      // await db.execute('PRAGMA foreign_keys = ON;');

      // Create tables 
      await db.execute(piiTable);
      await db.execute(userTable);
    }, version: dbVersion);
    return dbOpened;
  }
}
