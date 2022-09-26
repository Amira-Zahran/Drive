import 'package:flutter/material.dart';
import '../../../../model/home/note_model/note_model.dart';
import '../../../../viewmodel/database/local/SQLITE_DB/database.dart';
import '../../../components/core/components/components.dart';
import '../../navigate/bottom_navigation_bar.dart';
import 'add_note.dart';

class Note extends StatefulWidget {
  Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<Notes> allNotes = [];

  @override
  void initState(){
    SQLHelper.initDb();
    getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){
              navigateTo(context, const NavigationBottomBar());
              }, icon: const Icon(Icons.arrow_back_ios), color: Colors.black,),
            title: const Text(
              'Notes',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          body: allNotes.length == 0
              ? const Center(child: Text("There's No Data To Show", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
              : ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: (){
                          navigateTo(context, AddNote.withNote(allNotes[index]));
                        },
                        leading: const Icon(Icons.note_alt_rounded),
                        title: Text(allNotes[index].name),
                        subtitle: Text(allNotes[index].description),
                      ),
                    ),
                  ),
                  itemCount: allNotes.length,
              ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey[200],
            onPressed: (){
              navigateTo(context, AddNote());
            },
            child: const Icon(Icons.add, color: Colors.black,),
          ),
        );
  }

  void getAllNotes()  {
    //todo get plants from db
    SQLHelper.getNotes().then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          allNotes.add(Notes.fromDbMap(value[i]));
        });
      }
    });
  }
}
