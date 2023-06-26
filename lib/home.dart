import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog app"),
      ),
      body: Center(
        child: Container(child: Text("Welcome to 30 days of flutter")),
      ),
      drawer: Drawer(),
    );
  }
}
