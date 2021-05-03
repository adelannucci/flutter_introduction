

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/providers/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Received Deposit';

const _labelValue = 'Value';
const _hintValue = '0.00';

const _textConfirm = 'Confirm';

class FormDeposit extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                hint: _hintValue,
                controller: _valueController,
                label: _labelValue,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textConfirm),
                onPressed: () => _doDeposit(context),
              ),
            ],
          ),
        ));
  }

  void _doDeposit(BuildContext context) {
    final double value = double.tryParse(_valueController.text);
    final validDeposit = _validateTransfer(context, value);

    if (validDeposit) {
      _updateState(context, value);

      Navigator.pop(context);
    }
  }

  _validateTransfer(context, value) {
    final _field = value != null;

    return _field;
  }

  _updateState(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}