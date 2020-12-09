import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wizers/constants.dart';

class NewTransaction extends StatelessWidget {
  final double opacity;
  final Function done;

  NewTransaction(this.opacity, this.done);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        color: Colors.white.withOpacity(opacity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              readOnly: true,
              initialValue: 'App Subscription',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12)),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    initialValue: '12',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        isDense: true,
                        icon: Icon(Icons.attach_money),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    initialValue: 'Business',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        isDense: true,
                        icon: Icon(Icons.work),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton.icon(
                  borderSide: BorderSide(width: 1, color: wizeRoxo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.today),
                  label: Text(DateFormat('dd MMMM,yyyy').format(DateTime.now()),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            RaisedButton.icon(
              color: wizeRoxo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onPressed: done,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                "Add",
                style: TextStyle(
                    fontSize: 12,
                    color: wizeCinza,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
