import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../../viewmodel/bloc/home/note/note_cubit.dart';
import '../../../components/add_note/add_note_components.dart';
import '../../../components/core/components/components.dart';
import 'note.dart';


class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return NoteCubit(); },
      child: BlocConsumer<NoteCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          NoteCubit myNote = NoteCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  popTo(context, const Note());
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
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    addNoteField(type: TextInputType.text, controller: myNote.titleController, text: 'Title'),
                    const SizedBox(height: 25,),
                    addNoteField(text: 'Date', type: TextInputType.text, controller: myNote.dateController, ),
                    const SizedBox(height: 25,),
                    addNoteField(type: TextInputType.text, controller: myNote.noteController, text: 'Note', lines: 10),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey[200],
                        fixedSize: const Size(90, 40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.add, color: Colors.black, size: 22,),
                          Text('Add', style: TextStyle(color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}