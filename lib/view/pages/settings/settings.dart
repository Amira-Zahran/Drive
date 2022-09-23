import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/pages/auth/login.dart';
import 'package:odc_drive_design_pattren/view/pages/settings/our_partners.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import '../../../viewmodel/bloc/settings/settings_cubit.dart';
import '../../components/core/components/components.dart';
import 'FAQs.dart';
import 'support.dart';
import 'terms&conditions.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return SettingsCubit(); },
      child: BlocConsumer<SettingsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          SettingsCubit mySettings = SettingsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: const Text('Settings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1) , ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    navigateTo(context, const FQA());
                  },
                  child: const ListTile(
                    leading: Text('FAQ', style: TextStyle(fontSize: 18, ),),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey,),
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.grey,endIndent: MediaQuery.of(context).size.width*.03, indent: MediaQuery.of(context).size.width*.03,),
                GestureDetector(
                  onTap: (){
                    navigateTo(context, const TermsConditions());
                  },
                  child: const ListTile(
                    leading: Text('Terms & Conditions', style: TextStyle(fontSize: 18,)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey,),
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.grey,endIndent: MediaQuery.of(context).size.width*.03, indent: MediaQuery.of(context).size.width*.03,),
                GestureDetector(
                  onTap: (){
                    navigateTo(context, const OurPartners());
                  },
                  child: const ListTile(
                    leading: Text('Our Parteners', style: TextStyle(fontSize: 18, ),),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey,),
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.grey,endIndent: MediaQuery.of(context).size.width*.03, indent: MediaQuery.of(context).size.width*.03,),
                GestureDetector(
                  onTap: (){
                    navigateTo(context, const Support());
                  },
                  child: const ListTile(
                    leading: Text('Support', style: TextStyle(fontSize: 18, )),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey,),
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.grey,endIndent: MediaQuery.of(context).size.width*.03, indent: MediaQuery.of(context).size.width*.03,),

                GestureDetector(
                  child: const ListTile(
                    leading: Text('Log out', style: TextStyle(fontSize: 18, ),),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey,),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                      dialogType: DialogType.noHeader,
                      title: 'Logout',
                      desc:
                      'Are You Sure ?',
                      btnOkOnPress: () {
                        navigateTo(context, const Login());
                      },
                      btnCancelOnPress: () {

                      },
                      //btnOkIcon: Icons.check_circle,
                    ).show();
                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
