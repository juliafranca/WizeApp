import 'package:flutter/material.dart';
import 'package:wizers/Components/dropdown.dart';
import 'package:wizers/Components/imgpicker.dart';
import 'package:wizers/Components/rounded_button_cinza.dart';
import 'package:wizers/Components/rounded_input_file.dart';
import 'package:wizers/Components/rounded_password_field.dart';

import '../constants.dart';
import 'menu/menu_principal.dart';

class Cadastro extends StatelessWidget {
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
                    height: size.height * 0.1,
                  ),

                  Text(
                    "Faça seu cadastro:",
                    style: TextStyle(color: wizeCinza),
                  ),
                  //user
                  Produto(),
                  RoundedInputField(
                    hintText: "Nome de usuário",
                    onChanged: (value) {},                    
                  ),
                  RoundedInputField(
                    hintText: "Seu email",
                    icon: Icons.mail,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "CNPJ/CPF",
                    icon: Icons.note,
                    onChanged: (value) {},
                  ),
                  Dropdown(),
                  RoundedInputField(
                    hintText: "Telefone",
                    icon: Icons.phone,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Endereço",
                    icon: Icons.location_on,
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Termos de uso",
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
                  )
                ])));
  }
}
