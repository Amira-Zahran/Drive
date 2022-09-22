import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class TermsConditionsCubit extends Cubit<CubitState>{
  TermsConditionsCubit() : super(InitialCubitState());

  static TermsConditionsCubit get(context) => BlocProvider.of(context);


}