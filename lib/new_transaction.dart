import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  dynamic _selectDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      enteredDate,
    );

    Navigator.of(context).pop();
  }

  Widget presentDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          // minimumYear: DateTime(2022),
          // maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              _selectDate = newDate;
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                    placeholder: "Enter Details",
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   amountInput = val;
                    // },
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                    placeholder: "Enter Amount",
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 8, right: 8, bottom: 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectDate == null
                              ? 'No Date Chosen'
                              : 'Picked Date: ${DateFormat.yMMMd().format(_selectDate)}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: [presentDatePicker()],
                              cancelButton: CupertinoActionSheetAction(
                                child: const Text('Done'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.systemBlue,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 180,
                //   child: CupertinoDatePicker(
                //     mode: CupertinoDatePickerMode.date,
                //     initialDateTime: DateTime(2022),
                //     maximumDate: DateTime.now(),
                //     onDateTimeChanged: (DateTime newDate) {
                //       setState(() {
                //         _selectDate = newDate;
                //       });
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  child: SizedBox(
                    height: 50,
                    child: CupertinoButton(
                      color: CupertinoColors.systemGreen,
                      pressedOpacity: 0.7,
                      padding: const EdgeInsets.all(10),
                      onPressed: _submitData,
                      child: const Text('Add Transaction'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
