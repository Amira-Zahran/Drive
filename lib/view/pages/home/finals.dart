import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import '../../../viewmodel/bloc/home/home_cubit.dart';
import '../navigate/bottom_navigation_bar.dart';

class Finals extends StatefulWidget {
  const Finals({Key? key}) : super(key: key);
  //int? filterSecond;
 /* Finals.finishedItems({super.key}){
    HomeCubit()..getFinishedFinals();
    Text('no');
  }*/


  @override
  State<Finals> createState() => _FinalsState();
}

class _FinalsState extends State<Finals> {

  StreamSubscription? connection;
  bool isOffline = false;



  @override
  Widget build(BuildContext context) {
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.none){
        setState(() {
          isOffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.ethernet){
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.bluetooth){
        setState(() {
          isOffline = false;
        });
      }
    });


    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getFinals(); },
      child: BlocConsumer<HomeCubit, CubitState>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          HomeCubit myFinals = HomeCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(onPressed: (){popTo(context, const NavigationBottomBar()); }, icon: const Icon(Icons.arrow_back_ios), color: Colors.deepOrange,),
                title: const Text('Finals', style: TextStyle(letterSpacing: 1, color: Colors.black, fontWeight: FontWeight.bold),),
                actions: [
                  PopupMenuButton<MenuItem>(
                    icon: const Icon(Icons.filter_alt, color: Colors.deepOrange),
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                      ...MenuItems.items.map(buildItem).toList(),
                    ],
                  )
                ],
                centerTitle: true,
              ),
              body: isOffline ? const Center(child: Text('No Internet Connection', style: TextStyle(fontSize: 20),)) : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: myFinals.isLoading == true? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)  : ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },
                    itemCount: myFinals.finalsModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(myFinals.finalsModel!.data![index].examSubject.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                                  Row(
                                    children: const [
                                      Icon(Icons.timer,color: Colors.black54,),
                                      Text('2hrs', style: TextStyle(color: Colors.black54,),),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(myFinals.finalsModel!.data![index].examDate!, style: const TextStyle(color: Colors.grey),),
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_month),
                                          Text(myFinals.finalsModel!.data![index].examDate.toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Start Time',  style: TextStyle(color: Colors.grey),),
                                      Row(
                                        children: [
                                          const Icon(Icons.watch_later, color: Colors.greenAccent,),
                                          Text(myFinals.finalsModel!.data![index].examStartTime.toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('End Time',  style: TextStyle(color: Colors.grey),),
                                      Row(
                                        children: [
                                          Icon(Icons.watch_later, color: Colors.pinkAccent[100],),
                                          Text(myFinals.finalsModel!.data![index].examEndTime.toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              );

        },
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Text(item.text)
  );

  void onSelected(BuildContext context, MenuItem item){
    switch(item){
      case MenuItems.allItem:
        break;
      case MenuItems.finishItem:
        //navigateTo(context, Finals.finishedItems);
        break;
      case MenuItems.remainingItem:
//        const Center(child: Text('No Exams Found'));
        break;
    }
  }
}


class MenuItem {
  final String text;

  const MenuItem({required this.text});


}

class MenuItems{
  static const List<MenuItem> items = [
    allItem,
    finishItem,
    remainingItem,
  ];

  static const allItem = MenuItem(text: 'All Sections');
  static const finishItem = MenuItem(text: 'Finished Sections');
  static const remainingItem = MenuItem(text: 'Remaining Sections');

}