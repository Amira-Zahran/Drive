import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../view/pages/home/home.dart';
import '../../../view/pages/news.dart';
import '../../../view/pages/settings/settings.dart';

class BottomNavBarCubit extends Cubit<CubitState>{
  BottomNavBarCubit() : super(InitialCubitState());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);



  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  int selectedIndex = 0;

  void navigate(index){
    selectedIndex = index;
    emit(NavigationSuccessState());

  }

}