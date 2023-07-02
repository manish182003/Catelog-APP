import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'dart:ui';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widget/theme.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widget/drawer.dart';
import 'package:flutter_application_1/widget/itemwidget.dart';

import 'addtocart.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, myroutes.cartroute);
          },
          backgroundColor: context.theme.focusColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if (Catelogmodel.items != null && Catelogmodel.items.isNotEmpty)
                cateloglist().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        )));
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catelog App".text.xl5.bold.color(context.theme.hintColor).make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}

class cateloglist extends StatelessWidget {
  const cateloglist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Catelogmodel.items.length,
      itemBuilder: (context, index) {
        final catelog = Catelogmodel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => homedetailpage(catelog: catelog)));
            },
            child: Catelogitem(catelog: catelog));
      },
    );
  }
}

class Catelogitem extends StatelessWidget {
  final Item catelog;

  const Catelogitem({super.key, required this.catelog})
      : assert(catelog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: catelog.id.toString(),
            child: catelogimage(image: catelog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg.color(context.theme.hintColor).bold.make(),
            catelog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 16),
              children: [
                "\$${catelog.price}".text.bold.xl.make(),
                addtocart(catelog: catelog)
              ],
            )
          ],
        ))
      ],
    )).color(context.theme.cardColor).roundedLg.square(150).make().py16();
  }
}

class catelogimage extends StatelessWidget {
  final String image;

  const catelogimage({super.key, required this.image}) : assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
