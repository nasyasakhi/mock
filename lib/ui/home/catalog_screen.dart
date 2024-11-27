import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/models/products.dart';
import 'package:mock_apps/settings/setting_screen.dart';
import 'package:mock_apps/ui/cart/cart_screen.dart';
import 'package:mock_apps/ui/detail/detail_screen.dart';
import 'package:mock_apps/ui/home/components/bottom_nav_bar.dart';
import 'package:mock_apps/ui/home/components/categories.dart';
import 'package:mock_apps/ui/home/components/items_card.dart';
import 'package:mock_apps/ui/profile/profile_screen.dart';
import 'package:mock_apps/ui/whishlist/whishlist_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  // List of header images and texts
  final List<Map<String, String>> headerImages = [
    {"image": "assets/images/banner_01.png"},
    {"image": "assets/images/banner_02.png"},
    {"image": "assets/images/banner_03.png"},
  ];

  int _selectedIndex = 0;

  // Daftar tampilan tab
  List<Widget> get _widgetOptions {
    return [
      const CatalogScreen(),
      const WhishlistScreen(),
      const CartScreen(),
      const SettingsScreen(),
      const ProfileScreen(),
    ];
  }

  // function untuk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
    // menyatakan bahwa inisial action untuk objek (bottom nav) pada index ke-0
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Hi, Nasya",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                // color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: defaultPadding,
                        right: defaultPadding,
                        left: defaultPadding),
                    child: Text(
                      "New Arrivals 😎",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // PageView for Header Images
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: headerImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                headerImages[index]['image']!,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      right: defaultPadding,
                      left: defaultPadding,
                    ),
                  ),
                  const Categories(),
                  const SizedBox(height: defaultPadding),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                       'Ray-Ban',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  // Bagian GridView
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: product.length,
                      itemBuilder: (context, index) => ItemsCard(
                        product: product[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: product[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : _widgetOptions[_selectedIndex], // tampilkan widget berdasarkan index
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}