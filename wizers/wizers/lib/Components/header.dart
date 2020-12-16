import 'package:flutter/material.dart';
import 'package:wizers/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wizers/models/expenses.dart';
import 'expenses_chart.dart';

class Header extends StatelessWidget {
  final Function addTransaction;

  const Header(this.addTransaction);

  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
        id: 'Expense',
        domainFn: (Expense expense, _) => expense.category,
        measureFn: (Expense expense, _) => expense.value,
        labelAccessorFn: (Expense expense, _) => '\$${expense.value}',
        colorFn: (Expense expense, _) =>
            charts.ColorUtil.fromDartColor(expense.color),
        data: [
          Expense('Vendas', 256.66, Color(0xff845EC2)),
          Expense('Fornecedores', 120.88, Color(0xffA178DF)),
          Expense('Compras', 300.50, Color(0xffBE93FD)),
        ])
  ];
  @override
  Widget build(BuildContext context) {
    final primaryColor = wizeRoxo;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * .5,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: ExpensesChart(
                _series,
                animate: true,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  onPressed: addTransaction,
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 124,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.playlist_add,
                          color: wizeCinza,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Nova Transação",
                          style: TextStyle(
                              fontSize: 12,
                              color: wizeCinza,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  color: wizeCinza,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Relatórios",
                          style: TextStyle(
                              fontSize: 12,
                              color: wizeCinza,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "Transações",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: wizeCinza),
              ),
            )
          ],
        ),
      ),
    );
  }
}
