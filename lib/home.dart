import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/drawer.dart';

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
      drawer: Mydrawer(),
    );
  }
}
