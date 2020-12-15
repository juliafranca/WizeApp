import 'package:flutter/material.dart';
import 'package:wizers/Components/imgpicker.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';

import '../../../../constants.dart';
import '../vendas.dart';

class NovaVenda extends StatefulWidget {
  @override
  _NovaVendaState createState() => _NovaVendaState();
}

class _NovaVendaState extends State<NovaVenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          elevation: 0,
          title: Text("Nova venda"),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: wizeCinza, //change your color here
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Cadastre uma venda:",
                  style: TextStyle(
                      fontSize: 18,
                      color: wizeRoxo,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Cliente',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(16)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Descrição da venda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(16)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'produtos adicionados',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(16)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Valor total',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(16)),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedButtonRoxo(
                text: "Salvar",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Vendas();
                  }));
                },
              )
            ],
          ),
        ));
  }
}
