import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountContoller = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountContoller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount);
    Navigator.of(context)
        .pop(); //closing input data and kind of returns to the previous page
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
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountContoller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                  onPressed: submitData,
                  child: Text('Add transaction'),
                  style: TextButton.styleFrom(primary: Colors.purple),
                ),
              ]),
        ));
  }
}
