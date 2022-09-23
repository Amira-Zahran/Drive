import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../../viewmodel/bloc/settings/FAQs_cubit.dart';
import '../../components/core/components/components.dart';
import 'settings.dart';


class FQA extends StatelessWidget {
  const FQA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return FQACubit()..getFAQs(); },
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
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  navigateTo(context, const Settings());
                },
              ),              title: const Text(
                'FAQ',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            body: myFQA.faQsModel == null
                ? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)
                : ListView.separated(
                       separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },
                       itemCount: myFQA.faQsModel!.data!.length,
                       itemBuilder: (BuildContext context, int index) { return Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: ExpansionTile(
                           backgroundColor: Colors.deepOrange,
                           collapsedBackgroundColor: Colors.deepOrange,
                           childrenPadding: const EdgeInsets.all(10),
                           expandedAlignment: Alignment.center,
                           collapsedIconColor: Colors.white,
                           collapsedTextColor: Colors.white,
                           textColor: Colors.white,
                           title: Text(myFQA.faQsModel!.data![index].question.toString()),
                           children: [
                             Container(
                               width: double.infinity,
                                 padding: const EdgeInsets.all(8.0),
                                 decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                                 child: Text(myFQA.faQsModel!.data![index].answer.toString())),
                  ],
                ),
              ); },
            ),
          );
        },
      ),
    );
  }
}
