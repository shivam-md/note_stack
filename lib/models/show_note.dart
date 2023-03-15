// checks if note exists or not and depending upon result returns respective widgets

import 'package:flutter/material.dart';
import 'package:note_stack/helpers/custom_future_builder.dart';
import 'package:note_stack/helpers/custom_text_field.dart';

class DisplayNote extends StatelessWidget {
  const DisplayNote({Key? key, this.noteId}) : super(key: key);
  final int? noteId;

  @override
  Widget build(BuildContext context) {

    // if note id is not passed display empty CustomTextField
    if(noteId == null){
      return const CustomTextField();
    }
    //already existing note id passed push it to future builder to display note in detail
    else{
      return CustomFutureBuilder(noteId: noteId,);
    }
  }
}
