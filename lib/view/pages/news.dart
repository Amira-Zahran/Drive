
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:share_plus/share_plus.dart';

import '../../viewmodel/bloc/news_cubit.dart';


class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return NewsCubit()..getNews(); },
      child: BlocConsumer<NewsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          NewsCubit myNews = NewsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: const Text('News', style: TextStyle(color: Colors.black),),centerTitle: true, elevation: 0.0, backgroundColor: Colors.white,),
            body: myNews.newsModel == null ? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)  : ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },
              itemCount: myNews.newsModel!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                          width: MediaQuery.of(context).size.width *.9,
                          height: 250,
                          child: Image.network(myNews.newsModel!.data![index].imageUrl!)
                      ),
                      Positioned(
                          top: 15,
                          left: 10,
                          child: Text(myNews.newsModel!.data![index].title.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)),
                      Positioned(
                          top: 15,
                          right: 25,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: () async{
                                  final img = myNews.newsModel!.data![index].imageUrl;
                                  final body = myNews.newsModel!.data![index].body;
                                  final title = myNews.newsModel!.data![index].title;
                                  if(myNews.newsModel!.data!.isNotEmpty){
                                    await Share.share('$img $body $title');
                                  }
                                  }, icon: const Icon(Icons.share_outlined, color: Colors.white,)),
                                Container(
                                  color: Colors.white,
                                  height: 30,
                                  width: 1,
                                ),
                                IconButton(onPressed: (){
                                  FlutterClipboard.copy(myNews.newsModel!.data![index].toString());
                                  Get.snackbar('Copy', 'News copied to clipboard');
                                  }, icon: const Icon(Icons.copy, color: Colors.white, size: 15,)),
                              ],
                            ),)),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(myNews.newsModel!.data![index].body.toString(), style: const TextStyle(color: Colors.white, fontSize: 17), ))
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


