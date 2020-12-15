import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';
import 'package:wizers/telas/clientes/home_page.dart';
import 'package:wizers/telas/menu/telas-menu/auxiliares/tarefas.dart';
import 'package:wizers/telas/menu/telas-menu/financeiro.dart';
import 'package:wizers/telas/menu/telas-menu/mensagens.dart';
import 'package:wizers/telas/menu/telas-menu/sobre.dart';
import 'package:wizers/telas/menu/telas-menu/vendas.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          elevation: 1,
          title: Text("Bem vindo ao WIZE"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Olá!! \nNavegue pelas categorias:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/basketdark.png",
                                  height: 80,
                                  width: 80,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Vendas();
                                  }));
                                },
                              ),
                              Text("Vendas", style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/moneydark.png",
                                  height: 80,
                                  width: 80,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Financeiro_Home();
                                  }));
                                },
                              ),
                              Text("Financeiro", style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/groupdark.png",
                                  height: 80,
                                  width: 80,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                                },
                              ),
                              Text("Clientes", style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/msgdark.png",
                                  height: 80,
                                  width: 80,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Mensagens();
                                  }));
                                },
                              ),
                              Text("Mensagens", style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/infodark.png",
                                  height: 80,
                                  width: 80,
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Sobre();
                                  }));
                                },
                              ),
                              Text("Sobre o app",
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Text("Veja suas proximas tarefas:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
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
                    SizedBox(
                      height: 20,
                    ),
                  ]))),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedButtonRoxo(
                text: "nova tarefa",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Tarefas();
                  }));
                },
              )
            ],
          ),
        ));
  }
}
