import 'package:flutter/material.dart';
import 'package:odc_drive_design_pattren/view/components/core/components/components.dart';
import 'package:odc_drive_design_pattren/view/pages/home/eventsScreen.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/database/network/internet_check/connectivity_provider.dart';
import 'Note/note.dart';
import 'finals.dart';
import 'lecutres.dart';
import 'midterms.dart';
import 'sections.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return /*MultiProvider(
        providers: [
        ChangeNotifierProvider(
           create: (context) => ConnectivityProvider(),
            child: Column(
              children: [
                const Finals(),
                const Midterms(),
                Sections(),
                Lectures()
              ],
            ),
        ),
        ],
        child: */Material(
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
                                    child: const Icon(Icons.menu_book_sharp, color: Colors.deepOrange, size: 35)
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
                              child: const Icon(Icons.groups_sharp, color: Colors.deepOrange, size: 35)
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
                      navigateTo(context, const Midterms());
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
                              child: const Icon(Icons.sticky_note_2_outlined, color: Colors.deepOrange, size: 35)
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
                              child: const Icon(Icons.my_library_books_outlined, color: Colors.deepOrange, size: 35)
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
                     /* _myPlugin.hasPermissions().then((value) {
                        if (!value!) {
                          _myPlugin.requestPermissions();
                        } else {
                         */ navigateTo(context, const EventsScreen());
                       /* }
                      });*/
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
                              child: const Icon(Icons.event_note_rounded, color: Colors.deepOrange, size: 35)
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
                              child: const Icon(Icons.note_add, color: Colors.deepOrange, size: 35,)
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
