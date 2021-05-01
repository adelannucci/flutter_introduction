import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _titleBar = "Transfers";


class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = <Transfer>[];

  @override
  State<StatefulWidget> createState() {
    return StateTransferList();
  }
}

class StateTransferList extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          return TransferItem(widget._transfers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));

          future.then((value) => _update(value));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(_titleBar),
      ),
    );
  }

  void _update(Transfer value) {
    if (value != null) {
      setState(() {
        widget._transfers.add(value);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.account.toString()),
      ),
    );
  }
}
