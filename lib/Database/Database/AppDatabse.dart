import 'dart:async';
import 'package:floor/floor.dart';
import 'package:one_only/Database/DAO%20Class/UserDeatilsDAO.dart';
import 'package:one_only/Database/ModelClass/userDetails_ModelClass.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//part 'AppDatabse.g.dart';

@Database(version: 1, entities: [UserDetailsModelClass])
abstract class AppDatabase extends FloorDatabase {
  UserDetailsDAO get userDetailsDao;
}
