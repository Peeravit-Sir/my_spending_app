import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
                color: CupertinoColors.systemGrey3,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: CupertinoColors.systemGrey,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount.toString()}',
                          style: const TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      DateFormat('d MMM, y').format(transactions[index].date)),
                  trailing: CupertinoButton(
                    onPressed: () {
                      print('Delete');
                    },
                    child: const Icon(CupertinoIcons.delete,
                        color: CupertinoColors.black),
                  ),
                ));
          }),
    );
  }
}
