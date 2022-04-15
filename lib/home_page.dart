import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:my_spending_app/models/transaction.dart';

import './transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> userTransactions = [
    Transaction(
      id: 't1',
      title: 'shoes',
      amount: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'food',
      amount: 10,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        leading: CupertinoButton(
          padding: const EdgeInsets.only(bottom: 10),
          minSize: 20,
          onPressed: () {
            print('PressLeft');
          },
          child: const Icon(CupertinoIcons.gear_solid,
              size: 26, color: CupertinoColors.black),
        ),
        // middle: Text(
        //   'Spending Tracker',
        //   style: TextStyle(fontSize: 23),
        // ),
        trailing: CupertinoButton(
          minSize: 20,
          padding: const EdgeInsets.only(bottom: 10),
          // pressedOpacity: 0.5,
          // iconSize: 30,
          // style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            print('PressRight');
          },
          child: const Icon(
            CupertinoIcons.plus,
            color: CupertinoColors.black,
            size: 28,
          ),
        ),
      ),
      backgroundColor: CupertinoColors.systemGrey2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(children: const [
                Text(
                  'Total spending this week',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ 0.00',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          TransactionList(transactions: userTransactions)
        ],
      ),
    );
  }
}
