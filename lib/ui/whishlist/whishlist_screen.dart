import 'package:flutter/material.dart';
import 'package:mock_apps/state-management/whishlist_provider.dart';
import 'package:provider/provider.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final wishlistProvider = Provider.of<WhishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
         title: const Text(
          'My Wishlist',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: wishlistProvider.wishlistItem.isEmpty
      ? const Center(
        child: Text(
                'Your Wishlist is empty!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
              ),
            ),
          )
      : ListView.builder(
        itemCount: wishlistProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          final wishlistItem = wishlistProvider.wishlistItem.values.toList() [index];
         return Card(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
          ),
          child: ListTile(
            leading: ClipRRect(
               borderRadius: BorderRadius.circular(8),
               child: Image.asset(
               wishlistItem.image,
               fit: BoxFit.cover,
               width: 50,
               height: 50,
               ),
               ),
            title: Text(
            wishlistItem.title,
            style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                wishlistProvider.removeItemFromFav(wishlistItem.id);
              }, 
            ),
          ),
        );
        }
      )
    );
  }
}