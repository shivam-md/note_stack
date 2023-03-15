import 'package:flutter/material.dart';
import 'package:note_stack/helpers/custom_grid_view.dart';

import 'noteDataScreen.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        const Positioned(child: CustomGridView()), // customGridView

        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              print('Button Pushed');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NoteDataScreen()),);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(60, 60),
              elevation: 1,
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
