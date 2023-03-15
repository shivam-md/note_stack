import 'package:flutter/material.dart';
import 'package:note_stack/Provider/database_provider.dart';
import 'package:note_stack/screens/notesListScreen.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider.init();

  runApp(ChangeNotifierProvider(
    create: (context) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: const Text('NoteStack'),
        ),
        body: const NotesListScreen(),
      ),
    );
  }
}
