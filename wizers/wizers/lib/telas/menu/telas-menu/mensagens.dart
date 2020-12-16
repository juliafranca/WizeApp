import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';
import 'package:wizers/providers/msgEnviada.dart';
import 'package:wizers/providers/msgReceidas.dart';
import 'package:wizers/telas/menu/telas-menu/auxiliares/nova_mensagem.dart';
import '../../../constants.dart';
import '../../../constants.dart';

class Mensagens extends StatefulWidget {
  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: wizeRoxo,
        title: Text("Mensagens"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.purple[600],
                        unselectedLabelColor: wizeRoxo,
                        tabs: [
                          Tab(text: 'Recebidas'),
                          Tab(text: 'Enviadas'),
                        ],
                      ),
                    ),
                    Container(
                        height: 490, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(children: <Widget>[
                          Container(
                              child: Column(
                            children: [
                              ListaRecebidas(),
                            ],
                          )),
                          Container(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 0.3,
                              ),
                              RoundedButtonRoxo(
                                text: "Nova Mensagem",
                                press: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NovaMensagem();
                                  }));
                                },
                              ),
                              ListaEnviadas(),
                            ],
                          )),
                        ]))
                  ])),
            ]),
      ),
    );
  }
}
