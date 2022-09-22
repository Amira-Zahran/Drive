import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class SupportCubit extends Cubit<CubitState>{
  SupportCubit() : super(InitialCubitState());

  static SupportCubit get(context) => BlocProvider.of(context);



}