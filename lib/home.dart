import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widget/drawer.dart';
import 'package:flutter_application_1/widget/itemwidget.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    // TODO: implement initState
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 5));
    final catelogjson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodedata = jsonDecode(catelogjson);
    final productdata = decodedata["products"];
    Catelogmodel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Catelogmodel.items != null && Catelogmodel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Catelogmodel.items.length,
                itemBuilder: (context, index) {
                  return itemwidget(
                    item: Catelogmodel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: Mydrawer(),
    );
  }
}
