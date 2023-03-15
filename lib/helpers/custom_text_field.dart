

import 'package:flutter/material.dart';
import '../models/new_or_updated_note.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.snapshot,
      this.descriptionMaxLine = 100,
      this.descriptionMinLine = 25
  }) : super(key: key);

  static const String titleHintText = 'Title';
  static const descriptionHintText = 'Description';
  final int descriptionMaxLine;
  final int descriptionMinLine;
  final AsyncSnapshot? snapshot;


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final String? title = snapshot?.data?.title;
    final String? description = snapshot?.data?.description;
    titleController.text = title ?? "";
    descriptionController.text = description ?? "";
    return Column(
      children: [
        // for storing title
        TextFormField(
          controller: titleController,
          onSaved: (value) {
            NewOrUpdatedNote.initialTitle = title ?? value;
            if (title != null) NewOrUpdatedNote.editedTitle = value;
          },
          minLines: 1,
          decoration: const InputDecoration(
            hintText: titleHintText,
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10,),

        // For storing description
        TextFormField(
          controller: descriptionController,
          onSaved: (value) {
            NewOrUpdatedNote.initialDescription = description ?? value;
            if (description != null) NewOrUpdatedNote.editedDescription = value;
          },
          minLines: descriptionMinLine,
          maxLines: descriptionMaxLine,
          decoration: const InputDecoration(
            hintText: descriptionHintText,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
