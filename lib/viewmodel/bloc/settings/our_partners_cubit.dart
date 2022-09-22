import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

class OurPartnersCubit extends Cubit<CubitState>{
  OurPartnersCubit() : super(InitialCubitState());

  static OurPartnersCubit get(context) => BlocProvider.of(context);


}