import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../constants.dart';
import '../../../constants.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: wizeRoxo,
        appBar: AppBar(
          backgroundColor: wizeRoxo,
          title: Text("Sobre o App"),
          centerTitle: true,
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
                  Center(
                    child: Text(
                      "Esse app foi desenvolvido como projeto final do curso de Especialização em desenvolvimento de aplicativos para Smartphones da ETEC SEBRAE, orientado pelo professor Francisco.",
                      style: TextStyle(
                        color: wizeCinza,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    "Nossa equipe:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: wizeCinza),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_left,
                            color: wizeCinza,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_right,
                            color: wizeCinza,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Créditos",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: wizeCinza),
                  )),
                  Text(
                    "Fonte:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: wizeCinza,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    text:
                        "Glacial Indifference : https://www.fontsquirrel.com/fonts/glacial-indifference",
                    style: TextStyle(
                      color: wizeCinza,
                      fontSize: 14,
                    ),
                    linkStyle: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Icones:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: wizeCinza,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    text: "Icons8 : https://icons8.com.br/",
                    style: TextStyle(
                      color: wizeCinza,
                      fontSize: 14,
                    ),
                    linkStyle: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Logo Wize:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        color: wizeCinza,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    text: "Criação própria - Time de Identidade visual Wize",
                    style: TextStyle(
                      color: wizeCinza,
                      fontSize: 14,
                    ),
                    linkStyle: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: Text(
                      "São Paulo - 2020",
                      style: TextStyle(color: wizeCinza),
                    ),
                  ),
                ])));
  }
}
