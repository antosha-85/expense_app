import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
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
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountContoller,
                  // onChanged: (val) {
                  //   amountInput = val;
                  // },
                ),
                TextButton(
                  onPressed: () {
                    addTransaction(titleController.text, double.parse(amountContoller.text));
                  },
                  child: Text('Add transaction'),
                  style: TextButton.styleFrom(primary: Colors.purple),
                ),
              ]),
        ));
  }
}
