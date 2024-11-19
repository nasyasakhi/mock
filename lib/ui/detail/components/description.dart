import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/models/products.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        product.description,
        style: const TextStyle(
          height: 1.5
        ),
      ),
    );
  }
}