import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF6D47F7),
            Color(0xFF9A3FFD),
            
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      //height: 100,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: TableCalendar(
          calendarStyle: const CalendarStyle(
           
            defaultTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          headerStyle: const HeaderStyle(
            titleCentered: true,
    
            leftChevronIcon: Icon(Icons.arrow_back_ios_new,color: Colors.white,weight: 20,),
            rightChevronIcon:Icon(Icons.arrow_forward_ios,color: Colors.white,weight: 20,),
            formatButtonVisible: false,
            titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white)),
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
        ),
      ),
    );
  }
}
