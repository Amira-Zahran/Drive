import 'package:flutter/material.dart';
import 'package:odc_drive_design_pattren/view/pages/splash.dart';
import 'package:odc_drive_design_pattren/viewmodel/database/network/dio_helper.dart';
import 'viewmodel/database/local/SQFLITE_DB/database.dart';
import 'viewmodel/database/local/shared_prefrences/preference_utils.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await PreferenceUtils.init();
  SQLHelper.initDb();

  /*login = PreferenceUtils.getString(SharedKeys.apiToken).isNotEmpty;
  if (login == true) {
    home = const NavigationBottomBar();
  } else {
    home = const Login();
  }*/
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  /*final bool login;
  final Widget home;*/

  // ignore: use_key_in_widget_constructors
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}
