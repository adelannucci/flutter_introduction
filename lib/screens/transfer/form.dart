import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/providers/balance.dart';
import 'package:bytebank/models/providers/transfers.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String _titleBar = "New Transfer";
String _accountLabel = "Account number";
String _accountHint = "001";
String _valueLabel = "Value number";
String _valueHint = "0.0";
String _confirmButtonText = "Confirm";

class TransferForm extends StatelessWidget {
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
                controller: _controllerAccountNumber,
                hint: _accountHint,
                label: _accountLabel,
              ),
              Editor(
                hint: _valueHint,
                controller: _controllerValue,
                label: _valueLabel,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_confirmButtonText),
                onPressed: () => _doTransfer(context),
              ),
            ],
          ),
        ));
  }

  void _doTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double value = double.tryParse(_controllerValue.text);

    if (_validateTransfer(context, accountNumber, value)) {
      _updateState(context, Transfer(value, accountNumber), value);
      Navigator.pop(context);
    }
  }

  _validateTransfer(context, accountNumber, value) {
    final _filledFields = accountNumber != null && value != null;
    final _sufficientBalance =
        value <= Provider.of<Balance>(context, listen: false).value;

    return _filledFields && _sufficientBalance;
  }

  _updateState(context, transfer, value) {
    Provider.of<Transfers>(context, listen: false).add(transfer);
    Provider.of<Balance>(context, listen: false).less(value);
  }
}
