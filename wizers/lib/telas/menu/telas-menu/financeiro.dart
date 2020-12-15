import 'package:flutter/material.dart';
import 'package:wizers/Components/header.dart';
import 'package:wizers/Components/transaction_card.dart';
import 'package:wizers/Components/new_transition.dart';
import '../../../constants.dart';
import '../../../constants.dart';

class Financeiro_Home extends StatefulWidget {
  @override
  _Financeiro_HomeState createState() => _Financeiro_HomeState();
}

class _Financeiro_HomeState extends State<Financeiro_Home> {
  double _height = .55;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      _height = .08;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      _height = 0.5;
      _opacity = .9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wizeRoxo,
        title: Text("Financeiro"),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: wizeCinza, //change your color here
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Header(_addTransaction),
              NewTransaction(_opacity, _done)
            ],
          ),
          TransactionCard(_height),
        ],
      ),
    );
  }
}
