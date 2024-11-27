import 'package:flutter/material.dart';

class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;

  WishlistItem(this.image, {required this.id, required this.title, required this.price});
}

class WhishlistProvider with ChangeNotifier {
  final Map<String, WishlistItem> _wishlistItems = {};

  Map<String, WishlistItem> get wishlistItem => _wishlistItems;

  int get itemCount => wishlistItem.length;

  void addItemToFav(String id, String title, int price, String image) {
    if (_wishlistItems.containsKey(id)) {
      // jika sudah ada item yang ditambahkan ke keranjang
      return;
    } else {
      _wishlistItems.putIfAbsent(
        id, 
        () => WishlistItem(image, id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String id) {
  _wishlistItems.remove(id);
  notifyListeners();
  }


  void clearWishlist() {
      _wishlistItems.clear();
      notifyListeners();
    }
  }

