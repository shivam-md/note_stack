import 'package:flutter/material.dart';
import 'package:note_stack/Provider/database_provider.dart';
import 'package:note_stack/helpers/custom_grid_view.dart';
import 'package:note_stack/models/note_structure.dart';
import 'package:intl/intl.dart';
import 'package:note_stack/models/show_note.dart';
import 'package:note_stack/screens/notesListScreen.dart';
import '../database/database_services.dart';
import '../helpers/custom_button.dart';
import '../models/new_or_updated_note.dart';

class NoteDataScreen extends StatelessWidget {
  const NoteDataScreen({
    Key? key,
    this.noteId,
  }) : super(key: key);
  final int? noteId;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Colors.white,

        //drawer: Drawer(),
        appBar: AppBar(
          title: const Text('NoteStack'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CustomButton(
                          height: 40,
                          width: 50,
                          onTap: () {
                            print('save button tapped');//test

                            // below code runs because TextFormField widgets are inside same Form widget
                            formkey.currentState!.save(); // every onSaved function from TextFormField(s) are executed
                            final recordStatus = NewOrUpdatedNote.ref.status; // weather note is updated or created(new)
                            final noteValue = NewOrUpdatedNote.mapEntry; // all data we will push inside our db table or record

                            // if note updated successfully
                            if (recordStatus == 'Updated') {
                              print('note exists and is edited so saving changes: addNoteScreen');// test
                              DatabaseServices.instance.updateNote(
                                Note(
                                  id: noteId,
                                  isImportant: true,
                                  description: noteValue['description'],
                                  title: noteValue['title'],
                                  createdTime: DateTime.now(),
                                ),
                              );
                              DatabaseProvider().mapList;
                            }
                            // if new note created successfully
                            if(recordStatus == 'New'){
                              print('creating new note: addNoteScreen');// test
                              DatabaseServices.instance.create(Note(
                                  isImportant: true,
                                  description: noteValue['description'],
                                  title: noteValue['title'],
                                  createdTime: DateTime.now(),
                              ),
                              );
                              DatabaseProvider().mapList;
                            }
                            // data unchanged inside note
                            if(recordStatus == 'Unchanged') {
                              print(' No new data added to note: addNoteScreen'); // test
                            }
                            print('popping context : addNoteScreen');// test
                            Navigator.pop(context);
                          },
                          buttonChild: Row(
                            children: const [
                              Text('Save'),
                              Icon(Icons.done),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DisplayNote(noteId: noteId,),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
