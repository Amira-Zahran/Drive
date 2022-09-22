import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/home/lectures_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../model/home/section_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class HomeCubit extends Cubit<CubitState>{
  HomeCubit() : super(InitialCubitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SectionModel? sectionModel;

  Future<void> getSections()async{
    await DioHelper.getData(url: sectionEndPoint, token: accessToken).then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      emit(GetSectionsSuccess());
    });
  }



  LectureModel? lectureModel;

  Future<void> getLectures()async{
    await DioHelper.getData(url: lectureEndPoint, token: accessToken).then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      emit(GetSectionsSuccess());
    });
  }


  LectureModel? lectureModel;

  Future<void> getLectures()async{
    await DioHelper.getData(url: lectureEndPoint, token: accessToken).then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      emit(GetSectionsSuccess());
    });
  }

}