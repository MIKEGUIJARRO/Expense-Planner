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
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 2)),
                        child: Text(
                          "\$${_transactions[index].amount.toStringAsFixed(2)}", //String interpolation
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            _transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat().add_yMMMd().format(_transactions[index]
                                .date), //Codigo exportado de INTL
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
