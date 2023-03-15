import 'package:flutter/material.dart';
import 'package:note_stack/helpers/custom_text_field.dart';
import '../database/database_services.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({Key? key,required this.noteId}) : super(key: key);
  final int? noteId;
  @override
  Widget build(BuildContext context) {
    final json = DatabaseServices.instance.readNote(noteId);
    return FutureBuilder(
        future: json,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return CustomTextField(snapshot: snapshot,);
        }
    );
  }
}
