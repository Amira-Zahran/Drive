import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_drive_design_pattren/view/pages/auth/signup.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/auth/Login_cubit.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../navigate/bottom_navigation_bar.dart';
import '../../components/auth_components/auth_components.dart';
import '../../components/core/components/components.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return LoginCubit(); },
      child: BlocConsumer<LoginCubit, CubitState>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState /*|| state is GoogleAuthSucessState || state is FacebookAuthSucessState*/){
            navigateTo(context, const NavigationBottomBar());
            showTopSnackBar(
              context,
              const CustomSnackBar.success(
                message: "Logged in Successfully",
              ),
            );
          } else{
            Fluttertoast.showToast(msg: 'Please try again');
          }
        },
        builder: (BuildContext context, Object? state) {
          LoginCubit myLogin = LoginCubit.get(context);
          return Material(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        rowOrange(),
                        const SizedBox(height: 50,),
                        const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
                        const SizedBox(height: 15,),
                        defaultField(type: TextInputType.emailAddress, text: 'E-Mail', controller: myLogin.emailController,),
                        const SizedBox(height: 12,),
                        passWordField(text: 'Password', controller: myLogin.passwordController, type: TextInputType.visiblePassword, isPassword: myLogin.isPassword, iconButton: IconButton(onPressed: () => myLogin.hidePass(), icon: myLogin.isPassword
                                ? const Icon(Icons.visibility_off, color: Colors.deepOrange, size: 20,)
                                : const Icon(Icons.visibility, color: Colors.deepOrange, size: 20,),)),
                        const SizedBox(height: 12,),
                        TextButton(onPressed: () {}, child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              decoration: TextDecoration.underline, height: 1),
                        ),),
                        const SizedBox(height: 40,),
                        Center(
                          child: ElevatedButton(onPressed: (){
                            myLogin.login();
                            if(_formKey.currentState!.validate()){
                              return;
                            }
                          },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(320, 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))), child: const Text('Login', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        or(),
                        const SizedBox(height: 12,),
                        Center(
                          child: Container(
                            width: 320,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.deepOrange,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              onPressed: (){
                                navigateTo(context, SignUp());
                              },
                              child: const Text('Sign Up', style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
