import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_drive_design_pattren/model/home/note_model/note_model.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';

import '../../../../viewmodel/database/local/SQLITE_DB/database.dart';
import '../../../components/add_note/add_note_components.dart';
import 'note.dart';


class AddNote extends StatelessWidget {
  AddNote();

  AddNote.withNote(this.noteDetail) {
    titleController.text = noteDetail!.name;
    noteController.text = noteDetail!.description;
  }

  Notes? noteDetail;

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
        dateController.text = DateTime.now().toString();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () {
                navigateTo(context, Note());
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Note()));
              },
            ),
            title: const Text(
              'Add Note',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addNoteField(type: TextInputType.text, controller: titleController, text: 'Title', readOnly: false),
                  const SizedBox(height: 25,),
                  addNoteField(readOnly: true, text: 'Date', controller: dateController,),
                  const SizedBox(height: 25,),
                  addNoteField(type: TextInputType.text, controller: noteController, text: 'Note', lines: 10, readOnly: false),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: noteDetail == null
                          ? Colors.blueGrey[200]
                          : Colors.green,
                      fixedSize: const Size(90, 40),
                    ),
                    onPressed: () {
                      if (noteDetail == null) {
                        //todo add plant to db
                        SQLHelper.addNote(
                            titleController.text.toString(), noteController.text.toString());
                      } else {
                        //todo update plant from ui
                        SQLHelper.updateNote(noteDetail!.id,
                            titleController.text.toString(), noteController.text.toString());
                      }
                      Fluttertoast.showToast(msg: noteDetail == null ? 'Note Added' : 'Note Updated');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Note()));
                    },
                    child: noteDetail == null
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.add, color: Colors.black, size: 22,),
                            Text('Add', style: TextStyle(color: Colors.black, letterSpacing: 1, ),),
                          ],
                    )
                        : const Text("Update")
                  ),
                  noteDetail == null
                      ? const SizedBox()
                      : ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.red,
                           ),
                           onPressed: () {
                             //todo delete plant from ui
                             SQLHelper.deleteNote(noteDetail!.id);
                             Fluttertoast.showToast(msg: 'Note Deleted');
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Note()));
                           },
                           child: const Text("Delete"),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
