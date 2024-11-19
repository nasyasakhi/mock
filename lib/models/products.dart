import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });

    String getFormattedPrice() {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(price);
  }
}

List<Product> products = [
  Product(
    id: 1,
    title: "Ray-ban | Wayfarer",
    price: 533500,
    size: 17,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_01.png",
    color: const Color(0xFFF2FFF1)),
  Product(
    id: 2,
    title: "Ray-ban | Wayfarer",
    price: 349500,
    size: 12,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_02.png",
    color: const Color(0xFFE4F2F0)),
  Product(
    id: 3,
    title: "Ray-ban | Wayfarer",
    price: 425500,
    size: 20,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_03.png",
    color: const Color(0xFFD0C3C7)),
  Product(
    id: 4,
    title: "Ray-ban | Wayfarer",
    price: 578000,
    size: 40,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_04.png",
    color: const Color(0xFFD2C9B6)),
  Product(
    id: 5,
    title: "Ray-ban | Wayfarer",
    price: 425500,
    size: 24,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_05.png",
    color: const Color(0xFFFFE6EA)),
  Product(
    id: 6,
    title: "Ray-ban | Wayfarer",
    price: 380000,
    size: 20,
    description: "These stylish sunglasses combine sleek design with comfort, perfect for any occasion. The lightweight frame ensures a comfortable fit, while the UV-protective lenses keep your eyes safe. Available in various colors, they add a touch of sophistication to your look.",
    image: "assets/images/glasses/glasses_06.png",
    color: const Color(0xFFB0BBCC),
  ),
];