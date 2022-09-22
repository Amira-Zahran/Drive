import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class FQACubit extends Cubit<CubitState>{
  FQACubit() : super(InitialCubitState());

  static FQACubit get(context) => BlocProvider.of(context);


}