import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountContoller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTransaction(enteredTitle, enteredAmount);
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
