import 'package:flutter/material.dart';
import 'package:wizers/Components/imgpicker.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';

import '../../../../constants.dart';
import '../vendas.dart';

class NovoProduto extends StatefulWidget {
  @override
  _NovoProdutoState createState() => _NovoProdutoState();
}

class _NovoProdutoState extends State<NovoProduto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          elevation: 0,
          title: Text("Novo Produto"),
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
                  "Adicione um produto novo:",
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
              Produto(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Nome',
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
                    labelText: 'Descrição',
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
                    labelText: 'Valor',
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
