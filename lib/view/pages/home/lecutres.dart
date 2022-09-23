import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import '../../../viewmodel/bloc/home/home_cubit.dart';
import '../navigate/bottom_navigation_bar.dart';

class Lectures extends StatelessWidget {
  Lectures({Key? key}) : super(key: key);

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getLectures(); },
      child: BlocConsumer<HomeCubit, CubitState>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          HomeCubit myLectures = HomeCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(onPressed: (){popTo(context, const NavigationBottomBar()); }, icon: const Icon(Icons.arrow_back_ios), color: Colors.deepOrange,),
              title: const Text('Lectures', style: TextStyle(letterSpacing: 1, color: Colors.black, fontWeight: FontWeight.bold),),
              actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.filter_alt), color: Colors.deepOrange)],
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: myLectures.lectureModel == null ? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)  : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },
                itemCount: myLectures.lectureModel!.data!.length,
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
                              Text(myLectures.lectureModel!.data![index].lectureSubject.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
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
                                  Text(myLectures.lectureModel!.data![index].lectureDate.toString(), style: const TextStyle(color: Colors.grey),),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month),
                                      Text(myLectures.lectureModel!.data![index].lectureDate.toString()),
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
                                      Text(myLectures.lectureModel!.data![index].lectureStartTime.toString()),
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
                                      Text(myLectures.lectureModel!.data![index].lectureEndTime.toString()),
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
            ),
          );
        },
      ),
    );
  }
}

