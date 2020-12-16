import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  const Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.category,
    @required this.iconData,
    @required this.color,
  });
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: "Compra Material",
        value: 150.00,
        category: 'Compras',
        iconData: Icons.shopping_bag,
        color: Color(0xffBE93FD)),
    Transaction(
        id: 2,
        title: "Compra Embalagens",
        value: 56.00,
        category: 'Fornecedores',
        iconData: Icons.shopping_basket,
        color: Color(0xffA178DF)),
    Transaction(
        id: 2,
        title: "Venda produto",
        value: 56.00,
        category: 'Vendas',
        iconData: Icons.shopping_basket,
        color: Color(0xff845EC2)),
  ];

  List<Transaction> get transactions {
    return _transactions;
  }
}
