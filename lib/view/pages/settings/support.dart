import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../viewmodel/bloc/settings/support_cubit.dart';
import '../navigate/bottom_navigation_bar.dart';
import 'settings.dart';

class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return SupportCubit(); },
      child: BlocConsumer<SupportCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          SupportCubit mySupport = SupportCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange),
                onPressed: () {
                  popTo(context, const NavigationBottomBar());
                },
              ),              title: const Text('Support', style: TextStyle(letterSpacing: 1, color: Colors.black, fontWeight: FontWeight.bold),),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'Please enter your E-mail';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          prefixIcon: const Icon(Icons.mail),
                          hintText: 'E-Mail',
                        ),
                      ),
                      const SizedBox(height: 15,),

                      TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'Please enter your complaint';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        maxLines: 10,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: "What's making you unhappy?",
                        ),
                      ),
                      const SizedBox(height: 40,),
                      ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          return popTo(context, const NavigationBottomBar());
                        }
                      },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            fixedSize: const Size(320, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))), child: const Text('Submit', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
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
