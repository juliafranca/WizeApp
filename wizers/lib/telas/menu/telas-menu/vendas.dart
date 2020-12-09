import 'package:flutter/material.dart';
import 'package:wizers/constants.dart';

class Vendas extends StatefulWidget {
  @override
  _VendasState createState() => _VendasState();
}

class _VendasState extends State<Vendas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: wizeRoxo,
        elevation: 0,
        iconTheme: IconThemeData(
          color: wizeCinza, //change your color here
        ),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: wizeRoxo),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Vendas",
                      style: TextStyle(
                          color: wizeCinza,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
