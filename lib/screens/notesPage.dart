import 'package:flutter/material.dart';
import 'package:note_stack/database/database_services.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async{
    setState(() {
      isLoading = true;
    });
    notes = await DatabaseServices.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    DatabaseServices.instance.close();
    super.dispose();
  }
}
