import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _titleBar = "Nova Transferência";
String _accountLabel = "Account number";
String _accountHint = "001";
String _valueLabel = "Value number";
String _valueHint = "0.0";
String _confirmButtonText = "Confirm";

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateTransferForm();
  }
}

class StateTransferForm extends State<TransferForm> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                label: _accountLabel,
                hint: _accountHint,
                controller: _controllerAccountNumber),
            Editor(
                label: _valueLabel,
                hint: _valueHint,
                controller: _controllerValue,
                icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _doTransfer(context),
              child: Text(_confirmButtonText),
            )
          ],
        ),
      ),
    );
  }

  void _doTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double value = double.tryParse(_controllerValue.text);
    if (accountNumber != null && value != null) {
      final transfer = Transfer(value, accountNumber);
      Navigator.pop(context, transfer);
    }
  }
}
