
import 'package:flutter/cupertino.dart';
import 'package:note_stack/database/database_services.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note_structure.dart';

class DatabaseProvider extends ChangeNotifier{
  static Future<Database>? db; // database reference

  List<Note>? _noteList;
  static init(){
    db = DatabaseServices.instance.database;

  }

  DatabaseProvider(){
    displayAllNotes();
  }

  List<Note>? get mapList => _noteList;
  // asks database for all existing records
  displayAllNotes() async {
    _noteList = await DatabaseServices.instance.readAllNotes();
    notifyListeners();
  }



}