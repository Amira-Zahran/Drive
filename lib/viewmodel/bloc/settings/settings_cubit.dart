import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class SettingsCubit extends Cubit<CubitState>{
  SettingsCubit() : super(InitialCubitState());

  static SettingsCubit get(context) => BlocProvider.of(context);



}