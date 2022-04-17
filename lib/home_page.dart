import 'package:flutter/cupertino.dart';
import 'package:my_spending_app/models/transaction.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import './new_transaction.dart';
import './transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> userTransactions = [
  ];

  List<Transaction> get weeklyTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void startNewTransaction(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(addTx: addNewTransaction);
      },
    );
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        leading: CupertinoButton(
          pressedOpacity: 0.5,
          padding: const EdgeInsets.only(bottom: 10),
          minSize: 20,
          onPressed: () {
            print('settings button');
          },
          child: const Icon(CupertinoIcons.gear_solid,
              size: 26, color: CupertinoColors.black),
        ),
        trailing: CupertinoButton(
          minSize: 20,
          padding: const EdgeInsets.only(bottom: 10),
          pressedOpacity: 0.5,
          onPressed: () {
            startNewTransaction(context);
          },
          child: const Icon(
            CupertinoIcons.plus,
            color: CupertinoColors.black,
            size: 28,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(247, 255, 255, 255),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(children: [
                const Text(
                  'Total spending this week',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${weeklyTransactions.map((e) => e.amount).fold<double>(0, (prev, amount) => prev + amount).toString()}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          TransactionList(
            transactions: userTransactions,
            deleteTx: deleteTransaction,
          )
        ],
      ),
    );
  }
}
