import 'package:flutter/material.dart';

Widget rowOrange(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Orange ', style: TextStyle(color: Colors.deepOrange,  fontWeight: FontWeight.bold, fontSize: 20),),
      Text('Digital Center', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,  fontSize: 20), )
    ],
  );
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void popTo(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));
}

Widget buildSectionItem({height, width}) => Expanded(
  child: SizedBox(
    height: height / 7,
    child: Padding(
      padding:
      EdgeInsetsDirectional.only(start: width / 20, end: width / 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Card(
          elevation: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Flutter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    Row(
                      children: const [
                        Icon(
                          Icons.timer_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          "2hrs",
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Section Day",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                            Text("Wendnesday")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Start Time",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.green[200],
                            ),
                            const Text("12:00pm")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "End Time",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.red[100],
                            ),
                            const Text("2:00 Pm")
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  ),
);

Widget buildFinalItem({height, width}) => Expanded(
  child: SizedBox(
    height: height / 7,
    child: Padding(
      padding:
      EdgeInsetsDirectional.only(start: width / 20, end: width / 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Card(
          elevation: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Flutter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    Row(
                      children: const [
                        Icon(
                          Icons.timer_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          "2hrs",
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Exam Date",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                            Text("2022-08-18")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Start Time",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.green[200],
                            ),
                            const Text("12:00pm")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "End Time",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.red[100],
                            ),
                            const Text("2:00 Pm")
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  ),
);

