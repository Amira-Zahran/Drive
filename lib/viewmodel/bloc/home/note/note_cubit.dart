import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../../model/home/note_model/add_note_model.dart';
import '../../../database/local/SQFLITE_DB/database.dart';



class NoteCubit extends Cubit<CubitState>{
  NoteCubit() : super(InitialCubitState());

  static NoteCubit get(context) => BlocProvider.of(context);


  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  bool isLoading = true;
  List<NoteData> allNotes =[];

  getNotesData()  {
    emit(GetNoteData());
    SQLHelper.getNotes().then(
          (value) {
        for(int i = 0 ; i < value.length ; i++){
          allNotes.add(NoteData.fromJson(value[i]));
          isLoading = false;
        }
        emit(GetNoteData());
      },
    );
    emit(GetNoteData());
  }


}