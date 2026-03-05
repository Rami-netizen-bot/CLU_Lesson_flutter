import 'package:coffee_app/component/coffee_title.dart';
import 'package:coffee_app/model/coffee.dart';
import 'package:coffee_app/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cardpage extends StatefulWidget {
  const Cardpage({super.key});

  @override
  State<Cardpage> createState() => _CardpageState();
}

class _CardpageState extends State<Cardpage> {
  void removeFromcart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemtocart(coffee);
  }
  void payNow (){

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            Text("Your Cart", style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.userCart[index];

                  return CoffeeTitle(
                    coffee: eachCoffee,
                    onPressed: () => removeFromcart(eachCoffee),
                    icon: Icon(Icons.delete),
                  );
                },
              ),
            ),
           GestureDetector(
            onTap: payNow ,
          child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Pay Now", style: TextStyle(color: Colors.white)),
              ),
            ),
           )
          ],
        ),
      ),
    );
  }
}
