import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.text, required this.image});

  final String text, image; // membuat variabel final (wajib) untuk susunan splash screen

  @override
  Widget build(BuildContext context) {
    return Column( // tidak memakai scaffold karena ini isinya, kanvasnya berada pada splash_screen
      children: [
        const Spacer(), // membuat jarak antar widget
        Image.asset(   // memasukkan image
          image,
          height: 350,
          width: 350,
          fit: BoxFit.contain,
        ),
        Text( // styling title aplikasi untuk splash_screen
          'Mock',
          style: TextStyle(
            color: primaryColor,
            fontSize: getPropotionateScreenWidth(36.0),
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          text, // inisialisasi variabel (teks nya ada di body)
          style: TextStyle(
            color: Colors.grey, fontSize: getPropotionateScreenWidth(18)
          ),
            textAlign: TextAlign.center, // rata tengah
        ),
      ],
    );
  }
}