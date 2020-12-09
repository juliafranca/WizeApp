import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';

class Calend extends StatefulWidget {
  @override
  _CalendState createState() => _CalendState();
}

class _CalendState extends State<Calend> {
 CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: wizeRoxo, fontWeight: fontWeight);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.menu), onPressed: () {  },
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Veja suas proximas tarefas:"),
                TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                        weekdayStyle: dayStyle(FontWeight.normal),
                        weekendStyle: dayStyle(FontWeight.normal),
                        selectedColor: wizeRoxo,
                        todayColor: wizeRoxo),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: wizeRoxo,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      weekendStyle: TextStyle(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    headerStyle: HeaderStyle(formatButtonVisible: false),
                    calendarController: _controller),

                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left:30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight:Radius.circular(50) ),
                        color: wizeRoxo
                      ),

                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top:50),
                                child: Text(
                                  "Hoje", style: TextStyle(
                                    color: wizeCinza,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
              ],
            ),
          ),
        ));
  }
}
