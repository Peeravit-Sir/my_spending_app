import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          middle: Text(
            'Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        child: Material(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ExpansionTile(
              title: Text(
                'Apr 15, 2022',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Food',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    trailing: Text('\$40', style: TextStyle(fontSize: 18))),
                ListTile(
                    title: Text('Cake', style: TextStyle(fontSize: 18)),
                    trailing: Text('\$20', style: TextStyle(fontSize: 18))),
                ListTile(
                    title:
                        Text('Transportation', style: TextStyle(fontSize: 18)),
                    trailing: Text('\$10', style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
