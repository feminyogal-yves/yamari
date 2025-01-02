import 'package:flutter/material.dart';

import 'drink.dart';

class Yamari extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    //
    Drink(
      name: "Cherry Orange Sunset",
      price: "Ksh 500",
      ImagePath: "lib/images/cherry_orange.png",
    ),

    Drink(
      name: "Cherry ",
      price: "Ksh 400",
      ImagePath: "lib/images/cherry.png",
    ),

    Drink(
      name: "Grapefruit ",
      price: "Ksh 450",
      ImagePath: "lib/images/grapefruit.png",
    ),

    Drink(
      name: "Mango Orange",
      price: "Ksh 600",
      ImagePath: "lib/images/mango_orange.png",
    ),

    Drink(
      name: "Orange",
      price: "Ksh 300",
      ImagePath: "lib/images/orange.png",
    ),

    Drink(
      name: "Peach",
      price: "Ksh 400",
      ImagePath: "lib/images/peach.png",
    ),

    Drink(
      name: "Pink Grapefruit",
      price: "Ksh 600",
      ImagePath: "lib/images/pink_grapefruit.png",
    ),

    Drink(
      name: "Strawberry Kiwi",
      price: "Ksh 700",
      ImagePath: "lib/images/strawberry_kiwi.png",
    ),

    Drink(
      name: "Watermelon",
      price: "Ksh 200",
      ImagePath: "lib/images/watermelon.png",
    ),
  ];

  //list of drinks  in user cart
  final List<Drink> _userCart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
