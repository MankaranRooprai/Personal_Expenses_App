import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//class gathers data from TextFields and calls the addTx function which sets state in main.dart
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmountString = _amountController.text;

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

    final enteredAmount = double.parse(_amountController.text);

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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedData) {
      if (pickedData == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedData;
      });
    });
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
              controller: _titleController,
              onSubmitted: (val) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Rate your pain (1-10)',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => _submitData(),
              //onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Add Note'),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
