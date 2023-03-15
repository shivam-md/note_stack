import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../Provider/database_provider.dart';
import '../screens/noteDataScreen.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> minSize = [100, 150, 100, 150, 100, 100, 150];
    final random = Random();

    return Consumer<DatabaseProvider>(
      builder: (context, model, child) {
        return MasonryGridView.builder(
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: model.mapList!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteDataScreen(
                      noteId: model.mapList?.elementAt(index).id,
                    ),
                  ),
                );
              },
              child: Card(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: minSize[random.nextInt(minSize.length)],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.mapList!.elementAt(index).title,
                        maxLines: 4,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        model.mapList!.elementAt(index).description,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            //);
          },
        );
      },
    );
  }
  //
  // makeSynchronousList() async {
  //   //await DatabaseServices.instance.database;
  //   List<Note> noteList = await DatabaseServices.instance.readAllNotes();
  //   return noteList;
  // }
}
