import 'package:flutter/material.dart';
import 'package:mock_apps/models/products.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

   final Product product;

  @override
  Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;

    //ini buat definisiin ukuran proposional gambar sebagai variabel constant
    const double imageWidthRatio = 0.58; // ngambil 35% dari lebar layar
    const double imageHeightRatio = 0.36; //ngambil 20% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const Text(
            "Glasses", // Static title
            style: TextStyle(color: Color(0xFF4C4D4F)),
          ),
          const SizedBox(height: 5),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Color(0xFF4C4D4F),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(color: Color(0xFF4C4D4F)),
                    ),
                    Text(
                      product.getFormattedPrice(),
                      style: const TextStyle(
                        color: Color(0xFF4C4D4F),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio, 
                  height: size.height * imageHeightRatio, 
                  fit: BoxFit.contain
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}