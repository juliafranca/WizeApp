import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_cinza.dart';
import 'package:wizers/Components/rounded_input_file.dart';
import 'package:wizers/Components/rounded_password_field.dart';
import '../constants.dart';
import 'menu/menu_principal.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  void _authenticate(String _usuario, String _senha) async {
    String myurl = "https://postecnico.herokuapp.com/checkUser";
    http.post(myurl,
        headers: {"Content-Type": "application/json"},
        body: {"usuario": _usuario, "senha": _senha}).then((response) {
      print(response.statusCode);
      print(response.body);
      if (response == true) {
        _abrirHome();
      }
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
      _authenticate(_usuario, _senha);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wizeRoxo,
        appBar: AppBar(
            title: Text("WIZE"),
            elevation: 0,
            actions: [
              IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
            ],
            backgroundColor: wizeRoxo),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "images/logo1.png",
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: EdgeInsets.all(16),
                        labelText: "Login",
                        labelStyle: TextStyle(fontSize: 20, color: wizeCinza)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.all(16),
                          labelText: "Senha",
                          labelStyle:
                              TextStyle(fontSize: 20, color: wizeCinza)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _validarLogin();
                        }
                      },
                      color: wizeCinza,
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
