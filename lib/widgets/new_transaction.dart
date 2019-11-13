import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function handlerTransaction;

  NewTransaction(this.handlerTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  _submitData() {
    String enteredTitle = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; //Detiene la ejecucion del codigo y lo saca directamente
    }

    widget.handlerTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              /* onChanged: (String val){
                      titleInput = val;
                      print(titleInput);
                    }, */
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              //onChanged: (String val)=> amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.indigo,
              onPressed: () {
                //print(titleInput);
                //print(amountInput);

                _submitData();
              },
            )
          ],
        ),
      ),
    );
  }
}
