// import 'package:flutter/material.dart';
// import 'package:note_stack/screens/noteDataScreen.dart';
// import 'package:provider/provider.dart';
// import '../database/database_services.dart';
//
//
// class NotesGridView extends StatelessWidget {
//   const NotesGridView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DatabaseServices>(
//       builder: (context, model, child) {
//         return ListView(
//           children: [
//             ...model.notesList.map(
//               (entry) => Card(
//                 child: ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NotesScreen(
//                           noteId: entry.id,
//                         ),
//                       ),
//                     );
//                   },
//                   title: Text(
//                     entry.title,
//                     maxLines: 1,
//                   ),
//                   subtitle: Text(
//                     entry.description,
//                     maxLines: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
