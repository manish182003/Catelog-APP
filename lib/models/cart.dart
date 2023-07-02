import 'package:flutter_application_1/models/catelog.dart';

class cartmodel {

static final Cartmodel=cartmodel.internal();

cartmodel.internal();

factory cartmodel()=> Cartmodel;



  //catelog field
  Catelogmodel catelog=Catelogmodel();
 

//collection of id
  final List<int> itemids = [];

  //get catelog
  Catelogmodel get getcatelog => catelog;

  set setcatelog(Catelogmodel catelogmodel) {
    assert(catelogmodel != null);
    catelog = catelogmodel;
  }

//get item in the cart

  List<Item> get items => itemids.map((id) => catelog.getbyid(id)).toList();

//get total price

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

//add item

  void add(Item item) {
    itemids.add(item.id);
  }

// remove item
  void remove(Item item) {
    itemids.remove(item.id);
  }
}
