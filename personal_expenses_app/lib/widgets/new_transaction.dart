import 'package:flutter/material.dart';

import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
                // print(titleInput);
                // print(amountInput);
              },
            )
          ],
        ),
      ),
    );
  }
}