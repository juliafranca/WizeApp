import 'package:flutter/material.dart';
import 'package:wizers/constants.dart';
import '../providers/transactions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: transaction.color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Icon(
            transaction.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(transaction.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(
          transaction.category,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text(
          "R\$${transaction.value}",
          style: TextStyle(
              fontSize: 12, color: wizeRoxo, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
