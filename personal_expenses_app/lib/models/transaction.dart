import 'package:flutter/foundation.dart';

class Transaction {
  //all the info required when making a transaction
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //constructor to set initial values
  Transaction(
      //all initial values are required
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
