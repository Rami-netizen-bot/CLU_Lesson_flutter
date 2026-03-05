import 'package:coffee_app/homepage/homepage.dart';
import 'package:flutter/material.dart';

class Splashscreeen extends StatefulWidget {
  const Splashscreeen({super.key});

  @override
  State<Splashscreeen> createState() => _SplashscreeenState();
}

class _SplashscreeenState extends State<Splashscreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/Images/logo.png"),
              // Text(
              //   "Coffee Fin",
              //   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              // ),
              //   Text(
              //     "Safe & Yummy",
              //     style: TextStyle(
              //       fontSize: 25,
              //       color: Colors.pink[300],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  BorderRadius.circular(10);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: Text(
                  "Coffee Fin",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
