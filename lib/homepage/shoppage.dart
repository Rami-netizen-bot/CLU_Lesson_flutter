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
    showDialog(context: context, builder: (context)=>AlertDialog(title: Text("Successfully added to card"),));
  }
  

  @override
  Widget build(BuildContext context) { 
    return Consumer<CoffeeShop>(   
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(25.0),
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
                      icon: Icon(Icons.add),
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
