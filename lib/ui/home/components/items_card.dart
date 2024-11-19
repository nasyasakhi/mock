import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/models/products.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Hero( //efek trasisi keren ke detail page (animasi transisi antar layar)
                tag: "${product.id}", // untuk mendefinisikan tiap product, buat ambil id
                child: Image.asset(product.image) // ini buat isian nya
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.title,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.getFormattedPrice() //Menggunakan metode untuk mendapatkan harga terformat
          )
        ],
      ),
    );
  }
}