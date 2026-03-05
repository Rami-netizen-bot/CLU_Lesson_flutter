import 'package:coffee_app/model/coffee.dart';
import 'package:coffee_app/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {}

class OrderScreen extends StatefulWidget {
  final Coffee coffee;
  const OrderScreen({super.key, required this.coffee});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int quantity = 3;
  String selectedSize = 'S';
  final List<String> sizes = ['S', 'M', 'L'];

  void increment() => setState(() => quantity++);
  void decrement() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // Back button
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 18),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Coffee image
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Image.asset(
                  widget.coffee.imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Coffee name
            Text(
              widget.coffee.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${widget.coffee.price}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            const SizedBox(height: 36),

            // QUANTITY section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "QUANTITY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Minus button
                GestureDetector(
                  onTap: decrement,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),

                // Quantity number
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Plus button
                GestureDetector(
                  onTap: increment,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 36),

            // SIZE section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SIZE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: sizes.map((size) {
                final isSelected = size == selectedSize;
                return GestureDetector(
                  onTap: () => setState(() => selectedSize = size),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 12),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.brown[800] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        size,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // Add to cart button
            GestureDetector(
              onTap: () {
                // Add to cart
                Provider.of<CoffeeShop>(
                  context,
                  listen: false,
                ).addItemTocart(widget.coffee);

                // Show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.coffee.name} added to cart!"),
                    backgroundColor: Colors.brown[800],
                    duration: const Duration(seconds: 2),
                  ),
                );

                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
