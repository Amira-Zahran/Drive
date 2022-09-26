import 'package:flutter/material.dart';
import '../../components/core/components/components.dart';
import '../navigate/bottom_navigation_bar.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange),
              onPressed: () {
                popTo(context, const NavigationBottomBar());
              },
            ),
            title: const Text(
              'Our Partners',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                        width: double.infinity,
                        height: 250,
                        child: Image.network( "https://www.memento.fr/photos/26885/vignette-26885.jpg",),
                      ),
                      const Positioned(
                          top: 15,
                          left: 10,
                          child: Text('ODC', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 25),)
                      ),
                    ]
                ),
              ),
            ],
          ),

        );
  }
}
