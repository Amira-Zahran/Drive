import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/home/note_model/add_note_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import '../../../../viewmodel/bloc/home/note/note_cubit.dart';
import '../../../components/core/components/components.dart';
import '../../navigate/bottom_navigation_bar.dart';
import 'add_note.dart';

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return NoteCubit(); },
      child: BlocConsumer<NoteCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          NoteCubit myNotes = NoteCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(onPressed: (){popTo(context, const NavigationBottomBar()); }, icon: const Icon(Icons.arrow_back_ios), color: Colors.black,),
              title: const Text(
                'Notes',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            body: myNotes.allNotes.isEmpty
                ? const Center(child: Text("There's No Data To Show", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                       ListView.builder(
                           shrinkWrap: true,
                           //physics: NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) => buildNoteItems(myNotes.allNotes[index]),
                           itemCount: myNotes.allNotes.length,
                       )
                      ],
                     ),
                ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blueGrey[200],
              onPressed: (){
                navigateTo(context, const AddNote());
              },
              child: const Icon(Icons.add, color: Colors.black,),
            ),
          );
        },
      ),
    );
  }
  Widget buildNoteItems(NoteData data){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsetsDirectional.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text("${data.title}"),
          subtitle: Text("${data.description}"),
        ),
      ),
    );
  }
}
