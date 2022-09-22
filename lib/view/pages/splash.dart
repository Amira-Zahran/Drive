import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odc_drive_design_pattren/view/pages/navigate/bottom_navigation_bar.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            nextScreen: const NavigationBottomBar(),
            //(token == null) ? LoginScreen() : NavLayout(),
            duration: 2200,

            splash: Column(
              children: [

                rowOrange(),
                const SizedBox(height: 11),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    alignment: MainAxisAlignment.center,
                    width: MediaQuery.of(context).size.width* .7,
                    percent: 1,
                    animation: true,
                    animationDuration: 3000,
                    progressColor: const Color(0xFFFF6600),


                  ),
                ),
              ],


            ),
          ),
        ));
  }
}