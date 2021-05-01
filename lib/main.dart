import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: ByteBankApp(),
      ),
    ));

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber[900],
        accentColor: Colors.amberAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amberAccent[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: TransferList(),
    );
  }
}
