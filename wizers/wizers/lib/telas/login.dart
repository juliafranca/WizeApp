import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_cinza.dart';
import 'package:wizers/Components/rounded_input_file.dart';
import 'package:wizers/Components/rounded_password_field.dart';
import '../constants.dart';
import 'menu/menu_principal.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
   final ValueChanged<String> onChanged;

  const Login({Key key, this.onChanged}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seu usuário e senha para entrar";
  bool _showPassword = false;
 
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

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
      // _authenticate(_usuario, _senha);
      if (_usuario == "Julia" && _senha == "123") {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: wizeRoxo,
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
          iconTheme: IconThemeData(
            color: wizeCinza.withOpacity(0.3), //change your color here
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "images/logo1.png",
                    height: 150,
                    width: 120,
                  ),

                  SizedBox(
                    height: size.height * 0.2,
                  ),

                  Text(
                    "Bem vindo de volta!",
                    style: TextStyle(color: wizeCinza),
                  ),
                  //user
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                         filled: true,
                          fillColor: wizeCinza.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.all(16),
                          labelText: "Login",
                          labelStyle:
                              TextStyle(fontSize: 20, color: wizeCinza)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: wizeCinza, fontSize: 20.0),
                      controller: loginController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu Usuário";
                        }
                      },
                    ),
                  ),
                  //senha
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                       obscureText: !_showPassword,
        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: wizeCinza.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.all(16),
                          labelText: "Senha",                          
                          labelStyle: TextStyle(fontSize: 20, color: wizeCinza),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglevisibility();
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: wizeCinza, fontSize: 20.0),
                        controller: senhaController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira sua Senha";
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Esqueceu a senha? ",
                        style: TextStyle(color: wizeCinza, fontSize: 10),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "clique aqui!",
                          style: TextStyle(
                              color: wizeCinza,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),

                  RoundedButtonCinza(
                    text: "CONTINUAR",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        _validarLogin();
                      }
                    },
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                  )
                ]),
          ),
        ));
  }
}
