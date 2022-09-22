import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/settings/our_partners_cubit.dart';
import 'package:odc_drive_design_pattren/viewmodel/bloc/states.dart';

import '../../components/core/components/components.dart';
import 'settings.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return OurPartnersCubit(); },
      child: BlocConsumer<OurPartnersCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          OurPartnersCubit myOurPartners = OurPartnersCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange),
                onPressed: () {
                  navigateTo(context, const Settings());
                },
              ),
              title: const Text(
                'Our Partners',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                      children:[
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: const DecorationImage(
                            image: AssetImage('assets/orange.jfif'),
                            fit: BoxFit.cover,)
                          ),
                          width: MediaQuery.of(context).size.width *.9,
                          height: 250,
                        ),
                        const Positioned(
                            top: 15,
                            left: 10,
                            child: Text('ODC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)
                        ),
                      ]
                  ),
                ),
              ],
            ),

          );
        },
      ),
    );
  }
}
