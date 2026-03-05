import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/model/coffee.dart';
import 'package:coffee_app/model/coffee_shop.dart';

// ═══════════════════════════════════════════════════════════════
//  CARD PAGE  — updated payNow navigates to OrderSummaryScreen
// ═══════════════════════════════════════════════════════════════
class Cardpage extends StatefulWidget {
  const Cardpage({super.key});

  @override
  State<Cardpage> createState() => _CardpageState();
}

class _CardpageState extends State<Cardpage> {
  void removeFromcart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemtocart(coffee);
  }

  void payNow(List<Coffee> cart) {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Your cart is empty!"),
          backgroundColor: Colors.red[400],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    // ✅ Navigate to Order Summary Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderSummaryScreen(cart: cart),
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
                "Your Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              // Cart list
              Expanded(
                child: value.userCart.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined,
                                size: 64, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text("Your cart is empty",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[500])),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          Coffee eachCoffee = value.userCart[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ListTile(
                              title: Text(eachCoffee.name),
                              subtitle: Text("\$${eachCoffee.price}"),
                              leading: Image.asset(eachCoffee.imagePath),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => removeFromcart(eachCoffee),
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Pay Now button
              GestureDetector(
                onTap: () => payNow(value.userCart),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  ORDER SUMMARY SCREEN
// ═══════════════════════════════════════════════════════════════
class OrderSummaryScreen extends StatelessWidget {
  final List<Coffee> cart;

  const OrderSummaryScreen({super.key, required this.cart});

  double get _total => cart.fold(
      0, (sum, item) => sum + double.parse(item.price));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.arrow_back_ios_new, size: 18),
          ),
        ),
        title: const Text("Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order list
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final coffee = cart[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2))
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(coffee.imagePath,
                              height: 56, width: 56, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(coffee.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          "\$${coffee.price}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Divider
            const Divider(thickness: 1),
            const SizedBox(height: 12),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  "\$${_total.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[800]),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Confirm Order button
            GestureDetector(
              onTap: () {
                // Clear cart
                Provider.of<CoffeeShop>(context, listen: false)
                    .clearCart();

                // Show success then go back to shop
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: Colors.grey[200],
                    title: const Text("Order Placed! ☕"),
                    content:
                        const Text("Your coffee is being prepared."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);        // close dialog
                          Navigator.pop(context);        // back to cart
                          Navigator.pop(context);        // back to shop
                        },
                        child: const Text("OK",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "Confirm Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}