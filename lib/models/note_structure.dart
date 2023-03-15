/// Model Classes to help perform CRUD operation on the database
/// improves code readability and reducing code duplicity

const String TABLE_NAME = 'notes';

// model class used as middle person to push and receive data from the database table into acceptable format
class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String description;
  final String title;
  final DateTime createdTime;

  Note(
      {this.id,
      required this.isImportant,
      this.number = 100,
      required this.description,
      required this.title,
      required this.createdTime});

  // converting the notes data accepted from user into map push onto the database table.
  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.time: createdTime.toIso8601String()
      };

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        description: json[NoteFields.description] as String,
        title: json[NoteFields.title] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? description,
    String? title,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        description: description ?? this.description,
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
      );
}

// model class that stores notes database column names.
class NoteFields {
  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String description = 'description';
  static const String title = 'title';
  static const String time = 'time';

  static final List<String> values = [
    id,
    isImportant,
    number,
    description,
    title,
    time,
  ]; // table column name represented in a list.
}
