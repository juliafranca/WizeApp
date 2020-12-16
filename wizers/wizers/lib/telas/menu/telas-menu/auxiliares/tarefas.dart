import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wizers/constants.dart';

class Tarefas extends StatefulWidget {
  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  List _tarefa = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  final _tarefaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _tarefa = json.decode(data);
      });
    });
  }

  void addTarefa() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa["title"] = _tarefaController.text;
      novaTarefa["ok"] = false;
      _tarefaController.text = "";
      _tarefa.add(novaTarefa);
      _saveData();
    });
  }

//criar a funcao refesh
  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _tarefa.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
        _saveData();
      });
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        backgroundColor: wizeRoxo,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Cadastre uma tarefa:",
              style: TextStyle(
                  fontSize: 18, color: wizeRoxo, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova tarefa",
                        labelStyle: TextStyle(color: wizeRoxo)),
                    controller: _tarefaController,
                  ),
                ),
                RaisedButton(
                  color: wizeRoxo,
                  child: Text("Salvar"),
                  textColor: Colors.white,
                  onPressed: addTarefa,
                ),
              ])),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _tarefa.length,
                  itemBuilder: buildItem),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.purple,
          ),
        ),
      ),
      // direction: DismissDirection.startToEnd, // SE NÃO COLOCAR O DIRECTION, ELE VAI APAGAR DESLIZANDO PARA QUALQUER LADO
      child: CheckboxListTile(
        title: Text(_tarefa[index]['title']),
        value: _tarefa[index]['ok'],
        secondary: CircleAvatar(
          child: Icon(_tarefa[index]['ok'] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _tarefa[index]['ok'] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction) {
        _lastRemoved = Map.from(_tarefa[index]);
        _lastRemovedPos = index;
        _tarefa.removeAt(index);
        _saveData();

        final snack = SnackBar(
          content: Text("Tarefa '${_lastRemoved["title"]}' removida!"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _tarefa.insert(_lastRemovedPos, _lastRemoved);
                _saveData();
              });
            },
          ),
          duration: Duration(seconds: 4),
        );
        Scaffold.of(context).showSnackBar(snack);
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}​​/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_tarefa);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
