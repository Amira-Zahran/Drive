import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class AddNoteCubit extends Cubit<CubitState>{
  AddNoteCubit() : super(InitialCubitState());

  static AddNoteCubit get(context) => BlocProvider.of(context);



}