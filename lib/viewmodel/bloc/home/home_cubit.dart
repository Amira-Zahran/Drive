import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/home/finals_model.dart';
import 'package:odc_drive_design_pattren/model/home/lectures_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../model/home/midterms_model.dart';
import '../../../model/home/section_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/local/shared_prefrences/string/failures.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../../database/network/internet_check/internet_connection_checker.dart';

class HomeCubit extends Cubit<CubitState>{
  HomeCubit() : super(InitialCubitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  InternetConnection? internetConnection;

  Future<void> getData() async {
    await DioHelper.getData(url: gradeEndPoint, token: accessToken).then((value) {
      sectionModel = SectionsModel.fromJson(value.data);
      print(value.data);
      emit(GetSectionsSuccess());
    });
  }

  SectionsModel? sectionModel;

  Future<void> getSections()async{
    //if (await internetConnection!.isConnected) {
      await DioHelper.getData(url: sectionEndPoint, token: accessToken).then((value) {
        sectionModel = SectionsModel.fromJson(value.data);
        emit(GetSectionsSuccess());
      });
    /*}else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }


  LectureModel? lectureModel;

  Future<void> getLectures()async{
    if (await internetConnection!.isConnected) {
      await DioHelper.getData(url: lectureEndPoint, token: accessToken).then((value) {
      lectureModel = LectureModel.fromJson(value.data);
      emit(GetLecturesSuccess());
    });
    }else{
      OFFLINE_FAILURE_MESSAGE;
    }
  }


  FinalsModel? finalsModel;

  Future<void> getFinals()async{
    if (await internetConnection!.isConnected) {
      await DioHelper.getData(url: examsEndPoint, token: accessToken).then((value) {
      finalsModel = FinalsModel.fromJson(value.data);
      emit(GetFinalsSuccess());
    });
    }else{
      OFFLINE_FAILURE_MESSAGE;
    }
  }


  MidtermsModel? midtermsModel;

  Future<void> getMidterms()async{
    if (await internetConnection!.isConnected) {
      await DioHelper.getData(url: userExamsEndPoint, token: accessToken).then((value) {
        midtermsModel = MidtermsModel.fromJson(value.data);
        emit(GetMidtermsSuccess());
      });
    }else{
      OFFLINE_FAILURE_MESSAGE;
    }
  }

}