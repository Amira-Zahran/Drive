import 'package:flutter/material.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/view/pages/Note/note.dart';
import 'package:odc_drive_design_pattren/view/pages/home/midterms.dart';
import 'finals.dart';
import 'lecutres.dart';
import 'sections.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const SizedBox(height: 10,),
          rowOrange(),
          const SizedBox(height: 30,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children:[
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, Lectures());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Lectures",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, Sections());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Sections",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, Midterms());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Midterms",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, Finals());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Finals",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      //navigateTo(context, Lectures());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Events",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(15),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, Note());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: const Icon(Icons.label),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Notes",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}