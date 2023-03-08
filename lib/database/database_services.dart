
import 'package:note_stack/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  // static named constructor.
  static final DatabaseServices instance = DatabaseServices._init();

  // database instance
  static Database? _database;

  // private constructor
  DatabaseServices._init();

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    else{
      _database = await _initDB('notes.db');
      return _database!;
    }
  }
  // initializing database
  Future _initDB(String databaseName) async{
    final dbPath = await getDatabasesPath();
    final path = join(databaseName,dbPath);

    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  // database creation
  Future _createDB(Database db, int version) async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    // creating table
    await db.execute('''
    CREATE TABLE $TABLE_NAME (
    ${NoteFields.id} $idType,
    ${NoteFields.isImportant} $boolType,
    ${NoteFields.title} $textType,
    ${NoteFields.description} $textType,
    ${NoteFields.number} $integerType,
    ${NoteFields.time} $textType
    )
    ''');
  }

  // Creating Notes inside our database table
  Future<Note> create(Note note) async {
    final db = await instance.database;

    // this can be replaced using rawInsert property instead of insert and then we'll have to write the sql query to insert data inside our db table.
    final id = await db.insert(TABLE_NAME,note.toJson()); // returns unique id for each insert
    return note.copy(id: id);
  }

  // Reading a specific note containing id
  Future<Note> readNote(int? id) async {
    final db = await instance.database;

    final maps = await db.query(TABLE_NAME,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return Note.fromJson(maps.first); // returns first value that matches our query.
    } else {
      throw Exception('ID $id not found');
    }
  }

  // Reading all the notes inside of the notes table
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    const String orderBy = '${NoteFields.time} ASC';
    // final result = await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy'); // same as below code just sql query
    final result = await db.query(TABLE_NAME, orderBy: orderBy);
    // map our result and then convert them to note from a json object and returns list of notes
    return result.map((json) => Note.fromJson(json)).toList();

  }
  // update a note at a particular note using its id.
  Future<int> updateNote(Note note) async{
    final db = await instance.database;

    return db.update(
        TABLE_NAME,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;

    return db.delete(
        TABLE_NAME,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  // close database
  Future close() async{
    final db = await instance.database;
    db.close();
  }
}