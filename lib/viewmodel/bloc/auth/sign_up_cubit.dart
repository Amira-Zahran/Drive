import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/model/auth/university_model.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:odc_drive_design_pattren/viewmodel/database/network/end_points.dart';
import '../../../model/auth/grade_model.dart';
import '../../../model/auth/sign_up_model.dart';
import '../../database/network/dio_helper.dart';

class SignUpCubit extends Cubit<CubitState>{
  SignUpCubit() : super(InitialCubitState());

  static SignUpCubit get(context) => BlocProvider.of(context);


  SignUpModel? signUpModel;
  bool isPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  String grade='Grade 1';
  List<String> gradeItems = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
  ];
  void changeGrade(String value){
    grade=value;
    emit(ChangeGradeDropdownState());
  }
  List<String> genderItems = [
    'Male',
     'Female'
  ];
  GradeModel? gradeModel;


  String university='AUC';
  void changeUniversity(String value){
    university=value;
    emit(ChangeUniversityDropdownState());
  }
  List<String> universityItems = [
    'AUC',
    'MUST',
    'O6U',
    'CSC'
  ];
  UniversityModel? universityModel;


  String gender ='Male';
  void changeGender(String value){
    gender=value;
    emit(ChangeGradeDropdownState());
  }



  hidePass (){
    isPassword = !isPassword;
    emit(HidePasswordState());
  }
  Future<void> signUp ({
    required String roleId,
    required String universityId,
    required String gradeId,
  }) async{
    var json = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'name': nameController.text.toString(),
      'gender': 'f',
      'phoneNumber': phoneController.text.toString(),
      'universityId': 1,
      'gradeId': 4,
      'roleId': 2
    };
    await DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      print(value.data);
      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        emit(SignUpErrorState(error.response!.data['message'][0]));
      }
    });
  }
}