

class UpdateNotes{
  //CheckForChanges( this.title, this.editedTitle, this.description, this.editedDescription);

  static String? initialTitle;
  static String? editedTitle;
  static String? initialDescription;
  static String? editedDescription;

  static Map<String,String> getData(){
      return {'title':editedTitle!,'description': editedDescription!};
  }
}