import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../viewmodel/bloc/news_cubit.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return NewsCubit(); },
      child: BlocConsumer<NewsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          NewsCubit myNews = NewsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: const Text('News', style: TextStyle(color: Colors.black),),centerTitle: true, elevation: 0.0, backgroundColor: Colors.white,),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                      width: MediaQuery.of(context).size.width *.9,
                      height: 250,
                      child: rowOrange()
                  ),
                  const Positioned(
                      top: 15,
                      left: 10,
                      child: Text('ODCs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)),
                  Positioned(
                      top: 15,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined, color: Colors.white,)),
                            Container(
                              color: Colors.white,
                              height: 30,
                              width: 1,
                            ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.copy, color: Colors.white, size: 15,)),
                          ],
                        ),)),
                  const Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text('ODC Supports All Universities', style: TextStyle(color: Colors.white, fontSize: 17), ))

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
