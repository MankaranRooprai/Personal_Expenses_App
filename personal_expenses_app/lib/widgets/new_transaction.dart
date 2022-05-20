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

  submitData() {
    final enteredTitle = titleController.text;
    final enteredAmountString = amountController.text;

    if (enteredAmountString.isEmpty && enteredTitle.isEmpty) {
      Navigator.of(context).pop();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a description and a rating'),
        ),
      );
    } else if (enteredTitle.isEmpty) {
      Navigator.of(context).pop();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a description of how you are feeling'),
        ),
      );
    } else if (enteredAmountString.isEmpty) {
      Navigator.of(context).pop();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a rating between 1-10'),
        ),
      );
    }

    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount < 1 || enteredAmount > 10) {
      Navigator.of(context).pop();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a rating between 1-10'),
        ),
      );
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
                labelText: 'How are you feeling today?',
              ),
              controller: titleController,
              onSubmitted: (val) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Rate your pain (1-10)',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitData(),
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              textColor: Colors.blue,
              child: Text('Add Note'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
