import 'package:coffee_app/component/coffee_title.dart';
import 'package:coffee_app/model/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/model/coffee_shop.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}
class _ShoppageState extends State<Shoppage> {
  void addTocart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemTocart(coffee);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Successfully added to cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        duration: const Duration(seconds: 2),
        elevation: 6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How Would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeshop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeshop[index];
                    return CoffeeTitle(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addTocart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
