import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/settings/FAQs_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:odc_drive_design_pattren/viewmodel/database/network/internet_check/internet_connection_checker.dart';

import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class FQACubit extends Cubit<CubitState> {
  FQACubit() : super(InitialCubitState());

  static FQACubit get(context) => BlocProvider.of(context);

  InternetConnection? internetConnection;


  bool isLoading = true;


  FAQsModel? faQsModel;

  Future getFaqData() async {
    emit(GetFAQsSuccess());
    //if (await internetConnection!.isConnected) {
      await DioHelper.getData(url: faqEndPoint, token: accessToken).then((value) {
        if (value.statusCode == 200) {
          faQsModel = FAQsModel.fromJson(value.data);
            print(value.data);
          isLoading = false;
          emit(GetFAQsSuccess());
        }
      });
      emit(GetFAQsSuccess());
    } /*else {
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }
