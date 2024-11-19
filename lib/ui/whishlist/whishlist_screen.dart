import 'package:flutter/material.dart';
import 'package:mock_apps/models/products.dart';
import 'package:mock_apps/ui/detail/components/color_and_size.dart';
import 'package:mock_apps/ui/home/catalog_screen.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CatalogScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: product.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.favorite_border,
                    color: Color.fromARGB(255, 255, 0, 0)),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "BEST SELLER",
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                SizedBox(
                  width: 20, // Sesuaikan ukuran width
                  height: 20, // Sesuaikan ukuran height
                  child: ColorPicker(
                    color: Color(0xFF3D82AE),
                    isSelected: true,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: ColorPicker(
                    color: Color(0xFFF8C078),
                    isSelected: false,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: ColorPicker(
                    color: Color(0xFF989493),
                    isSelected: false,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
