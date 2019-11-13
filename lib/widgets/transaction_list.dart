import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(_transactions[index].title),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text("\$${_transactions[index].amount}"))),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
