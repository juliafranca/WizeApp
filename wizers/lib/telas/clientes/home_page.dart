import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wizers/constants.dart';
import 'package:wizers/helpers/database_helper.dart';
import 'package:wizers/models/contato.dart';

import 'contato_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = List<Contato>();

  @override
  void initState() {
    super.initState();

    //  Contato c = Contato(1,"João","joao@gmail.com.br",null);
    //  Contato c1 = Contato(2,"Ana Paula","ana_paula@gmail.com.br",null);
    //  db.insertContato(c);
    //  db.insertContato(c1);

    _exibeTodosContatos();
  }

  void _exibeTodosContatos() {
    db.getContatos().then((lista) {
      setState(() {
        contatos = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: wizeRoxo,
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exibeContatoPage();
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: wizeRoxo,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return _listaContatos(context, index);
        },
      ),
    );
  }

  _listaContatos(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: contatos[index].imagem != null
                            ? FileImage(File(contatos[index].imagem))
                            : AssetImage("images/persondark.png")),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(contatos[index].nome ?? "",
                            style: TextStyle(fontSize: 20)),
                        Text(contatos[index].email ?? "",
                            style: TextStyle(fontSize: 15)),
                      ],
                    )),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _confirmaExclusao(context, contatos[index].id, index);
                  },
                )
              ],
            )),
      ),
      onTap: () {
        _exibeContatoPage(contato: contatos[index]);
      },
    );
  }

  void _exibeContatoPage({Contato contato}) async {
    final contatoRecebido = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContatoPage(contato: contato)),
    );

    if (contatoRecebido != null) {
      if (contato != null) {
        await db.updateContato(contatoRecebido);
      } else {
        await db.insertContato(contatoRecebido);
      }
      _exibeTodosContatos();
    }
  }

  void _confirmaExclusao(BuildContext context, int contatoid, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir Contato"),
          content: Text("Confirma a exclusão do Contato"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Excluir"),
              onPressed: () {
                setState(() {
                  contatos.removeAt(index);
                  db.deleteContato(contatoid);
                });
                Navigator.of(context).pop();
              },
            )
          ], //widget
        );
      },
    );
  }
}
