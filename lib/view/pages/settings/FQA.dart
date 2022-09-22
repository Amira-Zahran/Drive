import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../viewmodel/bloc/settings/FQA_cubit.dart';


class FQA extends StatelessWidget {
  const FQA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return FQACubit(); },
      child: BlocConsumer<FQACubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          FQACubit myFQA = FQACubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: const BackButton(color: Colors.black,),
              title: const Text(
                'FAQ',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpansionTile(
                // collapsedBackgroundColor: Colors.cyan,
                collapsedBackgroundColor: Colors.deepOrange,
                childrenPadding: const EdgeInsets.all(10),
                expandedAlignment: Alignment.center,
                collapsedIconColor: Colors.white,
                collapsedTextColor: Colors.white,
                textColor: Colors.white,
                title: const Text('Q1: How many countries Orange \n Digital Center is in ?'),
                // Contents
                children: [
                  Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width *.8,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                      child: const Text('16 Country')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
