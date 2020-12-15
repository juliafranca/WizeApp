import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';
import 'package:wizers/Components/textfield_container.dart';
import 'package:wizers/telas/menu/telas-menu/mensagens.dart';

import '../../../../constants.dart';

class NovaMensagem extends StatefulWidget {
  @override
  _NovaMensagemState createState() => _NovaMensagemState();
}

class _NovaMensagemState extends State<NovaMensagem> {
  String dropdownValue = 'Escolha';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: wizeRoxo,
        elevation: 0,
        title: Text("Nova Mensagem"),
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
                " Deixe uma mensagem para gente!\n Iremos responder o mais rápido possível!\n O time Wize agradece!",
                style: TextStyle(
                    fontSize: 18, color: wizeRoxo, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
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
                  labelText: 'Tipo de Mensagem',
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
                  labelText: 'Sua mensagem aqui:',
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
                  return Mensagens();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
