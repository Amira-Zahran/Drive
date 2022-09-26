import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/core/components/components.dart';
import '../navigate/bottom_navigation_bar.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){popTo(context, const NavigationBottomBar()); }, icon: const Icon(Icons.arrow_back_ios), color: Colors.deepOrange,),
        title: const Text('Lectures', style: TextStyle(letterSpacing: 1, color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.filter_alt), color: Colors.deepOrange)],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              TableCalendar(
                calendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  tableBorder: TableBorder.all(
                    color: Colors.black12,
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange,
                  ),
                ),

                rowHeight: MediaQuery.of(context).size.height / 6.4,
                //daysOfWeekHeight: height/6,
                focusedDay: DateTime.now(),
                firstDay: DateTime(1900),
                lastDay: DateTime(2050),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
