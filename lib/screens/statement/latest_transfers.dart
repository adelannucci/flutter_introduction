import 'package:bytebank/models/providers/transfers.dart';
import 'package:bytebank/screens/statement/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_transfer.dart';

final _title = 'Latest transfers';
final _textButton = 'View all';

class LatestTransfers extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transfers>(
          builder: (context, transfers, child) {
            final _latestTransfers = transfers.transfers.reversed.toList();
            final _qtd = transfers.transfers.length;
            int size;

            if (_qtd < 3) {
              size = _qtd;
            } else {
              size = 2;
            }

            if (_qtd == 0) {
              return Card(
                margin: EdgeInsets.all(40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'You do not have any registered transfers yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: size,
              itemBuilder: (context, index) {
                final _transfer = _latestTransfers[index];
                final _value = _transfer.toStringValue();
                final _account = _transfer.toStringAccount();
                return Item.transfer(_value, _account);
              },
            );
          },
        ),
        FlatButton(
          color: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListMovements();
              }),
            );
          },
          child: Text(_textButton),
        )
      ],
    );
  }
}
