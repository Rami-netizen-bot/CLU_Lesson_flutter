class Coffee {
  final String name;
  final String price;
  final String imagePath;
  Coffee({required this.name, required this.price, required this.imagePath, required String description});

  static void addToCart(Coffee coffee) {}
}
