import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../viewmodel/bloc/settings/FAQs_cubit.dart';
import '../../components/core/components/components.dart';
import '../navigate/bottom_navigation_bar.dart';
import 'settings.dart';


class FQA extends StatelessWidget {
  const FQA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return FQACubit()..getFaqData(); },
      child: BlocConsumer<FQACubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          FQACubit myFQA = FQACubit.get(context);


          if (myFQA.isLoading != true) {
            final TextSpan textSpanQ = HTML.toTextSpan(
              context,
              myFQA.faQsModel!.data![0].question.toString(),
              linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
              },
              // as name suggests, optionally set the default text style
              defaultTextStyle: TextStyle(color: Colors.grey[700]),
              overrideStyle: <String, TextStyle>{
                'p': const TextStyle(fontSize: 17.3),
                'li': const TextStyle(fontSize: 17.3),
                'a': const TextStyle(wordSpacing: 2),
                // specify any tag not just the supported ones,
                // and apply TextStyles to them and/override them
              },
            );
            final TextSpan textSpanA = HTML.toTextSpan(
              context,
              myFQA.faQsModel!.data![0].answer.toString(),
              linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
              },
              // as name suggests, optionally set the default text style
              defaultTextStyle: TextStyle(color: Colors.grey[700]),
              overrideStyle: <String, TextStyle>{
                'p': const TextStyle(fontSize: 17.3),
                'li': const TextStyle(fontSize: 17.3),
                'a': const TextStyle(wordSpacing: 2),
                // specify any tag not just the supported ones,
                // and apply TextStyles to them and/override them
              },
            );

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(
                      Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () {
                    popTo(context, const NavigationBottomBar());
                  },
                ),
                title: const Text(
                  'FAQ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              body: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10,);
                },
                itemCount: myFQA.faQsModel!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: ExpansionTile(
                        backgroundColor: Colors.grey,
                        title: RichText(text: textSpanQ),
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(146, 70, 70, 69),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: ListTile(
                              title:
                              Center(child: RichText(text: textSpanA)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: const Icon(
                        Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () {
                      navigateTo(context, const Settings());
                    },
                  ),
                  title: const Text(
                    'FAQ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                body: const Center(
                  child: CircularProgressIndicator(color: Colors.deepOrange,),)
            );
          }
        })
    );
  }
}
