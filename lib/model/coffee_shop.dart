import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(name: 'Cappuccino',     price: '4.5', imagePath: "lib/Images/cappuccino.png", description: ''),
    Coffee(name: 'Chocolate Cafe', price: '4.5', imagePath: "lib/Images/late3.png", description: ''),
    Coffee(name: 'Ice Americano',  price: '4.5', imagePath: "lib/Images/late4.png", description: ''),
    Coffee(name: 'Ice Late',       price: '4.5', imagePath: "lib/Images/late2.png", description: ''),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeshop => _shop;
  List<Coffee> get userCart   => _userCart;

  void addItemTocart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemtocart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // ✅ Clear all items after order is placed
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }
}