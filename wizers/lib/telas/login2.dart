import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'menu/menu_principal.dart';

class LoginSecundario extends StatefulWidget {
  @override
  _LoginSecundarioState createState() => _LoginSecundarioState();
}

class _LoginSecundarioState extends State<LoginSecundario> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _senha = "123456";
  String _usuario = "Julia";

  String _infoText = "Informe seu usuário e senha para entrar";

  void _resetFields() {
    loginController.text = "";
    senhaController.text = "";
    setState(() {
      _infoText = "Informe seu usuário e senha para entrar";
    });
  }

  authenticate(String _usuario, String _senha) async {
    String myurl = "https://postecnico.herokuapp.com/checkUser";

    http.post(myurl, headers: {
      'Accept': 'application/json',
      'authorization': 'pass your key(optional)'
    }, body: {
      "usuario": _usuario,
      "senha": _senha
    }).then((response) {
      print(response.statusCode);
      print(response.body);
    });
  }

  void _abrirHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
  }

  void _validarLogin() {
    setState(() {
      String _usuario = loginController.text;
      String _senha = senhaController.text;
      if (_usuario == true && _senha == true) {
        _infoText = " Bem vinda (o) $_usuario";
        _abrirHome();
      } else {
        _infoText = "Usuário ou Senha Incorretos. Tente novamente";
        loginController.text = "";
        senhaController.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Agenda"),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
          backgroundColor: Colors.purple[100],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/bgm.png"),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Login",
                        labelStyle: TextStyle(
                          fontFamily: 'GeoSans',
                          fontSize: 20,
                        )),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'GeoSans',
                        color: Colors.black,
                        fontSize: 20.0),
                    controller: loginController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Usuário";
                      }
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            fontFamily: 'GeoSans',
                            fontSize: 20,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GeoSans',
                          color: Colors.black,
                          fontSize: 20.0),
                      controller: senhaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua Senha";
                        }
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(fontFamily: 'GeoSans', fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _validarLogin();
                        }
                      },
                      color: Colors.purple[200],
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    )),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                )
              ],
            ),
          ),
        ));
  }
}
