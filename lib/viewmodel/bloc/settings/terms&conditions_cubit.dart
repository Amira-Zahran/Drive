import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:odc_drive_design_pattren/viewmodel/database/network/internet_check/internet_connection_checker.dart';
import '../../../model/settings/terms_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class TermsConditionsCubit extends Cubit<CubitState>{
  TermsConditionsCubit() : super(InitialCubitState());

  static TermsConditionsCubit get(context) => BlocProvider.of(context);

  InternetConnection? internetConnection;
  TermsModel? termsModel;

  bool isLoading = true;

  Future getTermData() async {
    //if (await internetConnection!.isConnected) {
    emit(GetTermsSuccess());
    await DioHelper.getData(url: termsEndPoint, token: accessToken).then((value) {
        if (value.statusCode == 200) {
          termsModel = TermsModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetTermsSuccess());

        }
      },
    );
    emit(GetTermsSuccess());
    /* }else{
      OFFLINE_FAILURE_MESSAGE;
    }*/
  }
}