import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/statement/latest_transfers.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('Recebe valor'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormDeposit();
                    }),
                  );
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('Nova Transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TransferForm();
                    }),
                  );
                },
              ),
            ],
          ),
          LatestTransfers()
        ],
      ),
    );
  }
}
