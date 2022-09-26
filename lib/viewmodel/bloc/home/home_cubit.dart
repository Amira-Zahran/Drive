import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/home/finals_model.dart';
import 'package:odc_drive_design_pattren/model/home/lectures_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../model/home/midterms_model.dart';
import '../../../model/home/section_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../../database/network/internet_check/internet_connection_checker.dart';

class HomeCubit extends Cubit<CubitState>{
  HomeCubit() : super(InitialCubitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  InternetConnection? internetConnection;

  bool isLoading = true;

  late StreamSubscription connection;
  bool isOffline = false;

  getConnectionChecker (){
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.none){
        isOffline = true;
        emit(InternetConnectedSuccess());
      }else if(result == ConnectivityResult.mobile){
          isOffline = false;
          emit(InternetNotConnected());
      }else if(result == ConnectivityResult.wifi){
        isOffline = false;
        emit(InternetNotConnected());
      }else if(result == ConnectivityResult.ethernet){
        isOffline = false;
        emit(InternetNotConnected());
      }else if(result == ConnectivityResult.bluetooth){
        isOffline = false;
        emit(InternetNotConnected());
      }
    });

  }


  List<String> items = [
    'All Sections',
    'Finished Sections',
    'Remaining Sections',
  ];
  void changeItems(String value){
    items = value as List<String>;
    emit(ChangeGradeDropdownState());
  }





  SectionsModel? sectionModel;

  Future getSections()async{
    //if (await internetConnection!.isConnected) {
    emit(GetSectionsSuccess());
    await DioHelper.getData(url: sectionEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        sectionModel = SectionsModel.fromJson(value.data);
        isLoading = false;
        emit(GetSectionsSuccess());
      }
    });
    emit(GetSectionsSuccess());

    /*}else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }


  LectureModel? lectureModel;

  Future getLectures()async{
    ///if (await internetConnection!.isConnected) {
    emit(GetLecturesSuccess());
    await DioHelper.getData(url: lectureEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        lectureModel = LectureModel.fromJson(value.data);
        isLoading = false;
        emit(GetLecturesSuccess());
      }
    });
      emit(GetLecturesSuccess());
    /* }else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }


  FinalsModel? finalsModel;

  Future getFinals()async{
    //if (await internetConnection!.isConnected) {
      emit(GetFinalsSuccess());
      await DioHelper.getData(url: examsEndPoint, token: accessToken).then((value) {
        if (value.statusCode == 200) {
          finalsModel = FinalsModel.fromJson(value.data);
          isLoading = false;
          emit(GetFinalsSuccess());
        }
      });
      emit(GetFinalsSuccess());
   /* }else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }

  Future getFinishedFinals()async{
    //if (await internetConnection!.isConnected) {
    emit(GetFinalsSuccess());
    await DioHelper.getData(url: examsIdEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        finalsModel = FinalsModel.fromJson(value.data);
        isLoading = false;
        emit(GetFinalsSuccess());
      }
    });
    emit(GetFinalsSuccess());
    /* }else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }



  MidtermsModel? midtermsModel;

  Future getMidterms()async{
    //if (await internetConnection!.isConnected) {
    emit(GetMidtermsSuccess());
    await DioHelper.getData(url: userExamsEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        midtermsModel = MidtermsModel.fromJson(value.data);
        isLoading = false;
        emit(GetMidtermsSuccess());
      }
    });
    emit(GetMidtermsSuccess());

    /* }else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }

}