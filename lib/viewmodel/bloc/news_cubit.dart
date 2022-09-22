import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class NewsCubit extends Cubit<CubitState>{
  NewsCubit() : super(InitialCubitState());

  static NewsCubit get(context) => BlocProvider.of(context);


}