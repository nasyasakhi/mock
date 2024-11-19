import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

   List<Map<String, dynamic>> categories = [
    {"icon": Icons.remove_red_eye, "text": "Ray-Ban"},
    {"icon": Icons.camera, "text": "Prada"},
    {"icon": Icons.lightbulb, "text": "Persol"},
    {"icon": Icons.science, "text": "Oakley"},
  ];
  int selectedIndex = 0; //buat ngasi tau perubahan indexnya


  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and view all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              GestureDetector(
                onTap: () {},  //ini masi dummy
                child: const Text(
                  "view all",
                  style: TextStyle(
                    color: Color(0xFF236A91),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding), // Memberikan sedikit jarak

          // Horizontal list of categories with icons
          SizedBox(
            height: 65, // Atur tinggi untuk ikon dan teks
            child: ListView.builder( //membuat list yang bisa di-scroll secara horizontal
              scrollDirection: Axis.horizontal, //mengatur arah scroll menjadi horizontal
              itemCount: categories.length,
              //item builder itu buat membangun atau menampung data (apapun yang akan tampil di layar)
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector( //untuk mendeteksi gesture dari apa saja kayak ketuk atau geser atau longpress
      //Ini buat ngubah kategori yang dipilih pas diklik (inisialisasi)
      onTap: () {
        setState(() {
          selectedIndex = index; 
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10), // Mengurangi padding agar lebih kecil
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor.withOpacity(0.1) : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                categories[index]["icon"],
                color: selectedIndex == index ? primaryColor : secondaryColor,
                size: 20,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              categories[index]["text"],
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}