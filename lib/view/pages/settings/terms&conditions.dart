import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../viewmodel/bloc/settings/terms&conditions_cubit.dart';
import '../../components/core/components/components.dart';
import 'settings.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String htmlContent = """
<body>

<h1 style='color: white; font-size:50px; font-style:italic; background-color: rgb(0,122,255); font-weight:100;)'> Hello word! </h1>
<h1 style=''>Convert your <span style='color:lightseagreen;'>HTML</span> and <span style='color:dodgerblue'>CSS</span> easily into RichText</h1>
<p>Lorem ipsum dolor sit, consectetur adipiscing elit. Pellentesque in leo id dui bibendum fringilla in et arcu. In vehicula vel est sed mattis.</p>
<p><a href="https://google.com">Need more? click this link</a></p>
<p>We all spell <span style='color:crimson; text-decoration: underline wavy;'>recieve</span> wrong.<br />Some times we delete <del>stuff</del></p>
<div style='font-size:17px'>We write things that are <span style='font-size:1.5em;'>Big,</span> <b>bold</b>&nbsp; or <span style='color:brown'>colorful</span></div>
<p style='font-family:times;'>Some different FONT with <span style='background-color:lightcyan;'>this part highlighted</span></p>
<div style='line-height:2; font-size:17px'><b style='color: rgb(0,122,255); font-weight:500;'>Finally some line heights.</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in leo id dui bibendum fringilla in et arcu. In vehicula vel est sed mattis. Duis varius, sem non mattis.</div>

</body>
""";

    // or use HTML.toRichText()
    final TextSpan textSpan = HTML.toTextSpan(
      context,
      htmlContent,
      linksCallback: (dynamic link) {
        debugPrint('You clicked on ${link.toString()}');
      },
      // as name suggests, optionally set the default text style
      defaultTextStyle: TextStyle(color: Colors.grey[700]),
      overrideStyle: <String, TextStyle>{
        'p': const TextStyle(fontSize: 17.3),
        'a': const TextStyle(wordSpacing: 2),
        // specify any tag not just the supported ones,
        // and apply TextStyles to them and/override them
      },
    );
    return BlocProvider(
      create: (BuildContext context) { return TermsConditionsCubit(); },
      child: BlocConsumer<TermsConditionsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          TermsConditionsCubit myTermsConditions = TermsConditionsCubit.get(context);
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
              ),
              title: const Text(
                'Terms & Conditions',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: RichText(text: textSpan)),
            ),
          );
        },
      ),
    );
  }
}
