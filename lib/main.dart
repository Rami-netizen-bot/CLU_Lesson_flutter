import 'package:coffee_app/homepage/homepage.dart';
import 'package:coffee_app/homepage/splashscreeen.dart';
import 'package:coffee_app/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage/splashscreeen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreeen(),
      ),
    );
  }
}
