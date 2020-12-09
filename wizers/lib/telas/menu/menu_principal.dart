import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wizers/telas/clientes/home_page.dart';
import 'package:wizers/telas/menu/telas-menu/financeiro.dart';
import 'package:wizers/telas/menu/telas-menu/vendas.dart';

import '../../constants.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
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
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Bem vindo, @\n Navegue pelas categorias:",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              "images/persondark.png",
                              height: 80,
                              width: 80,
                            ),
                            onTap: () {},
                          ),
                          Text("Perfil",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
                        ],
                      ),
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
                          Text("Vendas",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
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
                          Text("Financeiro",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
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
                          Text("Clientes",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
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
                            onTap: () {},
                          ),
                          Text("Mensagens",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
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
                            onTap: () {},
                          ),
                          Text("Sobre o app",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: wizeRoxo),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              "Hoje",
                              style: TextStyle(
                                  color: wizeCinza,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
