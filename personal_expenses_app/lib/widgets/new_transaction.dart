import 'package:flutter/material.dart';

//class gathers data from TextFields and calls the addTx function which sets state in main.dart
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

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
                labelText: 'Description',
              ),
              controller: titleController,
              onSubmitted: (val) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Rating',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitData(),
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Note'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
