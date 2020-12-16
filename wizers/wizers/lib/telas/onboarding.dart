import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_cinza.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';

import '../constants.dart';
import 'login.dart';
import 'cadastro.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.09,
              ),
              Image.asset(
                "images/logo1.png",
                height: 150,
                width: 120,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Bem vindo ao \n WIZE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Um novo jeito de gerenciar seu empreendimento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.16,
              ),
              Text(
                "Continue com:",
                style: TextStyle(
                  color: wizeCinza.withOpacity(0.3),
                ),
                textAlign: TextAlign.center,
              ),
              RoundedButtonRoxo(
                text: "Acessar minha conta",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              ),
              RoundedButtonCinza(
                text: " Nova Conta",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Cadastro();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
