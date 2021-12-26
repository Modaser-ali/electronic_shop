class Clothes {
  final String name;
  final String imagePath;
  final double price;

  Clothes({required this.imagePath, required this.price, required this.name});
}

List<Clothes> clothes = [
  Clothes(
      price: 89.50,
      name: 'Red Sweatshirt',
      imagePath: 'assets/red-sweatshirt.png'),
  Clothes(
      imagePath: 'assets/Dress-Shirt-PNG-Picture.png',
      price: 75.0,
      name: 'Blue Shirt'),
  Clothes(
      imagePath: 'assets/Dress-Shirt-PNG-Clipart.png',
      price: 150.99,
      name: 'Black Shirt'),
  Clothes(
      imagePath: 'assets/Dress-Shirt-PNG-HD.png',
      price: 120.0,
      name: 'Protective Shirt')
];
