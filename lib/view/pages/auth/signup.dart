import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/view/pages/auth/login.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../viewmodel/bloc/auth/sign_up_cubit.dart';
import '../../components/auth_components/auth_components.dart';


class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //lazy: true,
      create: (BuildContext context) { return SignUpCubit(); },
      child: BlocConsumer<SignUpCubit, CubitState>(
        listener: (BuildContext context, state) {
          if(state is SignUpSuccessState /*|| state is GoogleAuthSucessState || state is FacebookAuthSucessState*/){
            navigateTo(context, const Login());
          }
        },
        builder: (BuildContext context, Object? state) {
          SignUpCubit mySignUp = SignUpCubit.get(context);
          return Material(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        rowOrange(),
                        const SizedBox(height: 50,),
                        const Text('Sign Up',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
                        const SizedBox(height: 15,),
                        defaultField(type: TextInputType.text, controller: mySignUp.nameController, text: 'Name'),
                        const SizedBox(height: 12,),
                        defaultField(type: TextInputType.emailAddress, controller: mySignUp.emailController, text: 'E-Mail'),
                        const SizedBox(height: 12,),
                        passWordField(text: 'Password', controller: mySignUp.passwordController, type: TextInputType.visiblePassword, isPassword: mySignUp.isPassword, iconButton: IconButton(onPressed: () => mySignUp.hidePass(), icon: mySignUp.isPassword
                            ? const Icon(Icons.visibility_off, color: Colors.deepOrange, size: 20,)
                            : const Icon(Icons.visibility, color: Colors.deepOrange, size: 20,),),),
                        const SizedBox(height: 12,),
                        passWordField(validator: (value) {
                          if(mySignUp.phoneController.text != mySignUp.confirmPasswordController.text) {
                            return "Password Doesn't Match";
                          }
                          return null;
                          }, text: 'Confirm Password', controller: mySignUp.confirmPasswordController, type: TextInputType.visiblePassword, isPassword: mySignUp.isPassword, iconButton: IconButton(onPressed: () => mySignUp.hidePass(), icon: mySignUp.isPassword
                            ? const Icon(Icons.visibility_off, color: Colors.deepOrange, size: 20,)
                            : const Icon(Icons.visibility, color: Colors.deepOrange, size: 20,),),
                        ),
                        const SizedBox(height: 12,),
                        defaultField(type: TextInputType.phone, controller: mySignUp.phoneController, text: 'Phone'),
                        const SizedBox(height: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: 95,
                                      child: DropdownButton<String>(
                                          value: mySignUp.grade.toString(),
                                          items:  mySignUp.gradeModel?.data?.map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value.grade,
                                              child: Text(value.grade!),
                                            );
                                          }).toList(),
                                          onChanged:(value)=>mySignUp.changeGender(value!) ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('University',style: TextStyle(fontWeight: FontWeight.bold)),
/*
                                    SizedBox(
                                      width: 95,
                                      child: DropdownButton<String>(
                                          value: mySignUp.grade.toString(),
                                          items:  mySignUp.universityItems.map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value.grade.toString(),
                                              child: Text(value.grade!.toString()),
                                            );
                                          }).toList(),
                                          onChanged:(value)=>mySignUp.changeUniversity(value!.toString()) ),
                                    ),
*/
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Grade',style: TextStyle(fontWeight: FontWeight.bold)),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    width: 200,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 2,
                                      ),
                                    ),
                                    child: DropdownButton<String>(
                                        value: mySignUp.grade,
                                        items:  mySignUp.gradeModel?.data?.map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value.grade,
                                            child: Text(value.grade!),
                                          );
                                        }).toList(),
                                        onChanged:(value)=> mySignUp.changeGrade(value!) ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(onPressed: (){
                          mySignUp.signUp(universityId: '1', gradeId: '4', roleId: 'f');
                          if(_formKey.currentState!.validate()){
                            return;
                          }
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              fixedSize: const Size(320, 55),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))), child: const Text('Sign Up', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        const SizedBox(height: 12,),
                        or(),
                        const SizedBox(height: 12,),
                        Container(
                          width: 320,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.deepOrange,
                              width: 2,
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              navigateTo(context, const Login());
                            },
                            child: const Text('Login', style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
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
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
