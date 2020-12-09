import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_cinza.dart';
import 'package:wizers/Components/rounded_input_file.dart';
import 'package:wizers/Components/rounded_password_field.dart';
import '../constants.dart';
import 'menu/menu_principal.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: wizeRoxo,
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          elevation: 0,
          iconTheme: IconThemeData(
            color: wizeCinza.withOpacity(0.3), //change your color here
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
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
                  height: size.height * 0.20,
                ),

                Text(
                  "Bem vindo de volta!",
                  style: TextStyle(color: wizeCinza),
                ),
                //user
                RoundedInputField(
                  hintText: "usuario",
                  onChanged: (value) {},
                ),
                //senha
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MenuPrincipal();
                    }));
                  },
                ),
              ]),
        ));
  }
}
