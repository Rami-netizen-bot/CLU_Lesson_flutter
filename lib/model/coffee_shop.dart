import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Cappuccino',
      price: '4.5',
      imagePath: "lib/Images/cappuccino.png",
    ),
    Coffee(
      name: 'Chocolate Cafe',
      price: '4.5',
      imagePath: "lib/Images/late3.png",
    ),
    Coffee(
      name: 'Ice Americano',
      price: '4.5',
      imagePath: "lib/Images/late4.png",
    ),
    Coffee(name: 'Ice Late', price: '4.5', imagePath: "lib/Images/late2.png"),
  ];

  List<Coffee> _userCart = [];
  List<Coffee> get coffeeshop => _shop;
  List<Coffee> get userCart => _userCart;

  void addItemTocart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemtocart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
