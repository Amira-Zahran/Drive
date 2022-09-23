import '../../model/auth/login_model.dart';
import '../../model/auth/sign_up_model.dart';

class CubitState {}

class InitialCubitState extends CubitState{}

class DecreamentState extends CubitState{}

class HidePasswordState extends CubitState{}

class LoginLoadingState extends CubitState{}

class LoginSuccessState extends CubitState{
  final LoginModel loginModel ;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends CubitState{
  final String error;

  LoginErrorState(this.error);

}

class RegisterLoadingState extends CubitState{}

class SignUpSuccessState extends CubitState{
  final SignUpModel signUpModel ;

  SignUpSuccessState(this.signUpModel);
}

class SignUpErrorState extends CubitState{
  final String error;

  SignUpErrorState(this.error);

}

class ChangeGradeDropdownState extends CubitState {}
class ChangeUniversityDropdownState extends CubitState {}
class ChangeGenderDropdownState extends CubitState {}

class NavigationSuccessState extends CubitState{}

class GetSectionsSuccess extends CubitState{}
class GetLecturesSuccess extends CubitState{}
class GetFinalsSuccess extends CubitState{}
class GetMidtermsSuccess extends CubitState{}
class GetNewsSuccess extends CubitState{}

class GetFAQsSuccess extends CubitState{}
class GetTermsSuccess extends CubitState{}
