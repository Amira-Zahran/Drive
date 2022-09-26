import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../viewmodel/bloc/settings/terms&conditions_cubit.dart';
import '../../components/core/components/components.dart';
import '../navigate/bottom_navigation_bar.dart';
import 'settings.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return TermsConditionsCubit()..getTermData(); },
      child: BlocConsumer<TermsConditionsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          TermsConditionsCubit myTermsConditions = TermsConditionsCubit.get(context);

          if(myTermsConditions.isLoading != true) {
            final TextSpan textSpan = HTML.toTextSpan(
              context,
              myTermsConditions.termsModel!.data!.terms.toString(),
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
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  popTo(context, const NavigationBottomBar());
                },
              ),
              title: const Text(
                'Terms & Conditions',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: RichText(text: textSpan),
              ),),
            ),
          );
          } else{
            return Scaffold(backgroundColor: Colors.white, appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () {
                      popTo(context, const NavigationBottomBar());
                    },
                  ),
                  title: const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ), body: const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),));
          }
        },
      ),
    );
  }
}
