import 'package:flutter/material.dart';
import 'package:mock_apps/models/products.dart';
import 'package:mock_apps/state-management/whishlist_provider.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  // bentuk dari inisialisasi variabel
  final Product product;

  // int quantity = 1; -> ini bentuk deklarasi variabel

  @override
  Widget build(BuildContext context) {

    final wishlistProvider = Provider.of<WhishlistProvider>(context);

    // untuk memeriksa apakah produk ada di wishlist
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
       if (isFavorite) {
        // untuk menghapus item whishlist
         wishlistProvider.removeItemFromFav(product.id.toString());
       } else {
        // untuk menambahkan wishlist
        wishlistProvider.addItemToFav(
            product.id.toString(), // karena string(64 byte) dan id mempunyai size yang beda, gedean int(1049 byte) size nya
            product.title,
            product.price,
            product.image
          );
        }
      }, 
      icon:  Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade800,
      )
    );
  }
}