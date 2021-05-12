import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.99,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
