import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/news_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:odc_drive_design_pattren/viewmodel/database/network/end_points.dart';

import '../database/local/shared_prefrences/string/access.dart';
import '../database/network/dio_helper.dart';

class NewsCubit extends Cubit<CubitState>{
  NewsCubit() : super(InitialCubitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  Future<void> getNews() async{
    await DioHelper.getData(url: newsEndPoint, token: accessToken).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(GetNewsSuccess());
    });
  }

}