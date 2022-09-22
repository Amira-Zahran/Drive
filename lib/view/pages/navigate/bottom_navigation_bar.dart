import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../viewmodel/bloc/navigation/bottom_navigation_bar_cubit.dart';
import '../home/home.dart';
import '../news.dart';
import '../settings/settings.dart';


class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  static List<Widget> widgetOptions = <Widget>[
    const Home(),
    const News(),
    const Settings(),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) { return BottomNavBarCubit(); },
        child: BlocConsumer<BottomNavBarCubit, CubitState>(
          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state) {
            BottomNavBarCubit myNav = BottomNavBarCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: NavigationBottomBar.widgetOptions.elementAt(myNav.selectedIndex),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.deepOrange,
                      iconSize: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.black,
                      tabs: const [
                        GButton(
                          icon: LineIcons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: LineIcons.newspaper,
                          text: 'News',
                        ),
                        GButton(
                          icon: Icons.settings,
                          text: 'Settings',
                        ),
                      ],
                      selectedIndex: myNav.selectedIndex,
                      onTabChange: (index) {
                        myNav.selectedIndex = index;
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
