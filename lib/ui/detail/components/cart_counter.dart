import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/models/products.dart';
import 'package:mock_apps/state-management/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key, required this.product});

    final Product product;
    //ini adalah sebuah callback untuk mengirim quantity ke add to cart
   // final Function(int) onQuantityChanged;

  @override
  State<CartCounter> createState() => _CartCounterState();
}


class _CartCounterState extends State<CartCounter> {
  // default jumlah item
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
  // inisialisasi provider
  final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: <Widget>[
        // logika decrement (pengurangan)
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: quantity > 1 
          ? () {
            setState(() {
              //mengurangi quantity secara lokal
              quantity--;
            });
             // Untuk mengirim quantity terbaru
            cartProvider.removeItems(widget.product.id.toString());
           }
           // akan mendisable tombol jika quantity <= 1
           :null,
          child: const Icon(Icons.remove)
        ),
  
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"), //supaya tdk error apabila user menambahkan icon sudah 2 digit
            style: const TextStyle(fontSize: 18, color: textColor),
          ),
        ),

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: const Icon(Icons.add),
          onPressed: () {
            //increment
            //  quantity = quantity + 1 ->(cara singkat) quantity++ 
            setState(() {
              quantity++;
            });
            //pendeklarasian informasi yg akan di kirim kan ke add to cart (tombol keranjang)
           //starting poin dimana quantitas akan dibawa ke tombol keranjang
           cartProvider.addItem(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1, 
           );
          }, 
        )
      ],
    );
  }
}