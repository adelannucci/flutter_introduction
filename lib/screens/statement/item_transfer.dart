import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String _value;
  String _account;
  String _type;

  Item(this._value, this._account, this._type);

  Item.transfer(this._value, this._account) {
    this._type = 'debit';
  }

  Item.deposit(this._value) {
    this._type = 'credit';
    this._account = '';
  }

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final Map<String, Color> _colors = {
    'debit': Colors.red,
    'credit': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: _colors[widget._type],
          ),
          title: Text(widget._value),
          subtitle: Text(widget._account),
        ));
  }
}
