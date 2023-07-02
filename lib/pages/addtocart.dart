import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catelog.dart';

class addtocart extends StatefulWidget {
  final Item catelog;

  const addtocart({super.key, required this.catelog});

  @override
  State<addtocart> createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
  final cart = cartmodel();

  @override
  Widget build(BuildContext context) {
    bool IsInCart = cart.items.contains(widget.catelog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!IsInCart) {
            IsInCart = IsInCart.toggle();
            final catelogmodel = Catelogmodel();
            cart.setcatelog = catelogmodel;
            cart.add(widget.catelog);
            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.focusColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            IsInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
