import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.id, 
    required this.title, 
    required this.price,
    required this.image,
    
    //default quantity
    this.quantity = 1
  });
}

// biar kita tau apa bedanya OOP dan FP(functional programming)
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // Map<String, int> _quantities = {};

  // int getQuantity(String productId) => _quantities[productId] ?? 1;

  //ini buat ngitung total harga barang di keranjang
  //fungsinya untuk menghandle perhitungan total harga yang ada di keranjang
  int get totalPrice {
    return _items.values.fold(
      // inisial status sebelum
      0, // nilai default
      (sum, item) => sum + item.price * item.quantity 
    );
  }

  void addItem(String id, String title, int price, String image, int quantity) {
    //kalau produk udah ada di keranjang, makanya tinggal add lagi
    //ini untuk menambahkan item ke keranjang dengan jumlah yang ditentukan dari cart counter
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity ; //kenapa pake bank operator? karna buat ngasih tau kalo ini tuh ga null, 
    } else {                            // !. ( safe null ) dan ! ( kebalikan )
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: 1);
    }
    notifyListeners();
  }

  void removeItems(String id) {

    // _items.remove(id); // klo mau langsung buang itemnya
    if (_items.containsKey(id)) {
      // buang ngurangin kuantitas item
      _items[id]!.quantity--;
    }

    // jika kuantitas menjadi 0, hapus item dari keranjang
    if (_items[id]!.quantity <= 0) {
      _items.remove(id);
    }
    notifyListeners();
  }

  // void updateQuantity(String productId, int quantity) {
  //   _quantities[productId] = quantity;
  //   notifyListeners(); 
  // }
}