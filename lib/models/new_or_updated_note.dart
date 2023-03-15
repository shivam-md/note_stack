

class NewOrUpdatedNote {
  NewOrUpdatedNote._();
  static final NewOrUpdatedNote ref = NewOrUpdatedNote._();

  static String? initialTitle;
  static String? editedTitle;
  static String? initialDescription;
  static String? editedDescription;
  String dbOperation = 'Unchanged';
  static int? id;
  static Map<String?, dynamic> mapEntry = {};

  String get status {
    // If note already exists
    if (initialTitle != null && editedTitle != null) {

      // note data updated as it has changed
      if (initialDescription != editedDescription || initialTitle != editedTitle) {
        print('editing existing note');
        mapEntry = {
          'title': editedTitle!,
          'description': editedDescription!,
          'id': id,
        };
        makeAllNull();
        dbOperation = 'Updated';
        return dbOperation;
      }
    }
    // if note does not exist
    // we will create new note
    if(editedTitle == null) {
      print('inserting new note');
      mapEntry = {
        'title': initialTitle!,
        'description': initialDescription!
      };
      makeAllNull();
      dbOperation = 'New';
      return dbOperation;
    }
    return dbOperation;
  }
  makeAllNull(){
    initialDescription = null;
    initialTitle = null;
    editedTitle = null;
    editedDescription = null;
    id = null;
  }
}
