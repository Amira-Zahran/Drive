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
    return BlocProvider(
      create: (BuildContext context) { return TermsConditionsCubit()..getTerms(); },
      child: BlocConsumer<TermsConditionsCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          TermsConditionsCubit myTermsConditions = TermsConditionsCubit.get(context);

          const String htmlContent = """
<body>
<div><h2 class=\"GenHeaderTow\" id=\"terms-conditions\">\n      
<a name=\"terms-conditions\"></a>Terms and Conditions</h2>
<p class=\"TextJust Bold\">By accessing, browsing and/or using all Orange environments existing in whatever form or format including but not limited to website (Web Portal), WAP Portal, USSD Portal, SMS Portal, Interactive Voice Response Portal, On-Device Portal herein referred to as “Orange Medium”, you agree to the following terms:</p>
<ol class=\"GenOrdList DetailsFont\">\n      <li>All Orange products and/or services are registered trademarks of The Egyptian Company for Mobile Services (Orange).<br><br> 
</li>\n      <li>All Contents in whatever form or format i​ncluding but not limited to (information, communications, wordings, text, images, footages and/or soundtracks, ringtones, sounds contained or available through any Orange environment/Medium are legally provided by Orange, its affiliates, independent content providers and recognized third parties.<br><br> 
</li>\n      <li>The contents provided on all Orange medium in whatever form or format are protected by relevant copyrights laws and regulations. Accordingly, all rights reserved.<br><br> 
</li>\n      <li>The contents of any Orange medium cannot be reproduced, modified, transferred, distributed, republished, downloaded, posted or transmitted in any form or by any means including but not limited to electronic, mechanical photocopying or recording or by any other means or technologies, without the prior written authorization of The Egyptian Company for Mobile Services (Orange).<br><br> </li>\n      
<li>You agree that all material, data and content in whatever form or format contained within or is for your own personal use only and may not be used for any commercial purposes or commercially/publicly distributed.<br><br> </li>\n      
<li>Orange will use its reasonable endeavors to maintain all Orange Medium in a fully operational mode.<br><br> </li>\n      
<li>Orange will not be responsible for the results of any defects that may exist beyond its reasonable control or due to any force majeure and/or any third party(s) misconduct.<br><br> </li>\n      
<li>You should not assume that all Orange medium or their respective content are error-free or that it will be suitable for the particular purposes that you have in mind when using them.<br><br> </li>\n      
<li>Orange reserves the right to conduct any changes, modifications and/or replacements, revamping, termination for any existing services and/or products, without any prior notification.<br><br> </li>\n     
<li>It is a condition of us allowing you to access to the information on any Orange Medium, that you accept the Orange terms &amp; conditions.<br><br> </li>\n      
<li>We will not be liable for any action you take relying on the information on such Medium.<br><br> </li>\n      
<li>Orange will not be liable if your use of material or information from any Orange medium that may result in the need for servicing, repair or correction of equipment or data, you assume at all times, any costs related to the above.<br><br> </li>\n      
<li>Orange reserves the right to impose relevant charges for browsing, accessing and/or purchasing activities to any Orange Mediums.<br><br> </li>\n     
<li>\n      Orange will inform you where a charge will be incurred by you for accessing certain services or information on the relevant Orange medium.<p>​</p>\n      </li>\n      
<li>If your equipment does not support relevant technologies including, but not limited to, encryption you may not be able to use certain services or access certain information on any Orange medium.<br><br> </li>\n      
<li>You may not mirror and/or copy by any means or form any material contained on any Orange medium on any other server(s) or environments regardless of its nature without the prior written consent of The Egyptian Company for Mobile Services (Orange).<br><br> </li>\n      
<li>The Egyptian Company for Mobile Services (Orange) reserve all rights to take the appropriate legal and/or judicial actions and remedies towards any unauthorized usage, intrusion and any other act of a violating nature that may cause any harm in whatever means to any Orange medium or its contents and/or images.<br><br> </li>\n      
<li>You acknowledge that Orange has no control over and excludes all and any liabilities for any material on the Internet which can be accessed by using any Orange medium, neither can we be deemed to have endorsed the content.<br><br> </li>\n      
<li>By submitting any material to Orange/Orange medium via email or otherwise, you fully and irrevocably acknowledge that Orange may freely and without any charge, copy, modify, distribute or create derivative work from that content in any form or means.<br><br> </li>\n      <li>You warrant that the provided material/content from your part are fit for publication and agree to indemnify Orange, if any third party(S) takes any kind of action against Orange in relation to the material that you have submitted.<br><br> </li>\n      <li>Accordingly, You hereby undertake, and commit to abide and comply with all applicable laws, regulations and Orange guidelines related to content nature and that such provided contents shall not exceed the acceptable bounds of taste, decency nor violate any, religions, traditions and/or beliefs.<br><br> </li>\n      <li>You warrant that Orange may publish (at its own discretion) the material you submit and/or make use of it or any concepts described in it in our products or services without liability and you agree not to take action against us in relation to it.<br><br> </li>\n      <li>In any Orange medium we may ask you to provide personal information that will enable us to use the information you provide us to keep you informed of our latest products and services after your visit to www.Orange.com. The personal information will be used in accordance with our online privacy policy.<br><br> </li>\n      <li>You undertake not to cause, instruct, or allow others to cause harm either directly or indirectly, hacking, any nuisance, annoyance, or inconvenience, whether to Orange or any of its customers or users of all Orange medium by any means.<br><br> </li>\n      <li>You also agree not to use any Orange medium to transmit and/or post any material which is defamatory, offensive or obscene of menacing character or which may be in Orange’s judgment, cause nuisance, annoyance, inconvenience to Orange, or any other person or which is illegal.<br><br> </li>\n      <li>You undertake that you will not interrupt, damage, render less efficient or impair in any way any Orange medium.<br><br> </li>\n      <li>Services are accessed via the World Wide Web which are independent of Orange medium. Your usage of the World Wide Web is solely at your own risk and is subject to all applicable national and international laws and regulations. Orange has no responsibility for any information or service obtained by you on the World Wide Web.<br><br> </li>\n      <li>Orange does not accept responsibility for any defects that may exist or for any costs, loss of profits, loss of data or consequential or inconsequential losses arising from your use of, or inability to use or access or a failure, suspension or withdrawal of all or part of the service at any time.<br><br> </li>\n      <li>Orange shall not be liable by any means or form and hereby excludes all liability whether in contract (including liability for negligence) or otherwise for the accuracy, suitability, quality or completeness of any information and the value and integrity of goods and services offered by third parties over Orange medium.<br><br> </li>\n      <li>You acknowledge that we have no control over and we exclude all liability for any material published on the World Wide Web, which can be accessed by using Orange medium.<br><br> </li>\n      <li>We may suspend or vary the whole or any part of the service offered on Orange medium for any reason, at any time at our sole discretion.<br><br> </li>\n      <li>Orange reserve the right to amend the stated herein terms from time to time. Such deviation shall be effective immediately upon posting of the varied Terms and Conditions. By continuing to use any Orange medium you will be deemed to accept such variation.<br><br> </li>\n      <li>Orange is not responsible for the content or reliability of websites to which we link nor should a link be taken as endorsement of any kind. Orange will not guarantee that these links will work all of the time and we have no control over the availability of linked pages.<br><br> </li>\n      <li>\n      If you have any questions about the above-mentioned Terms and Conditions or your rights under this online agreement please contact Orange by writing to:<br><br>\n      <p class=\"TextJust Bold MargZero\">The Egyptian Company for Mobile Services (Orange)<br> Nile City Building<br> 2005C, Cornishe El-Nil, Ramlet Boulaq<br> Cairo, Egypt<br> Postal Code: 11221</p>\n      </li></ol><br></div>"</body>
""";
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

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  popTo(context, const Settings());
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
              child: myTermsConditions.termsModel == null ? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)  : Expanded(child: RichText(text: textSpan)),
            ),
          );
        },
      ),
    );
  }
}
