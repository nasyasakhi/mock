import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/ui/auth/login_screen.dart';
import 'package:mock_apps/ui/auth/register_screen.dart';
import 'package:mock_apps/ui/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MockApp());
}

class MockApp extends StatefulWidget {
  const MockApp({super.key});

  @override
  State<MockApp> createState() => _MockAppState();
}

class _MockAppState extends State<MockApp> {

  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }


//an asynchronus process  to load the theme
  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  // SharedPreferences = untuk menyimpan data secara lokal
  // await itu buat nyimpan state terakhir dari proses async

  // ini buat ngatur perubahan statenya
  void _toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = isDark;
    });
    await prefs.setBool('isDarkTheme', isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // apabila true maka akan terdapat banner debug
      title: 'Mock App', // untuk menampilkan nama aplikasi di Task Switcher
      theme: ThemeData(
        brightness: _isDarkTheme ? Brightness.dark :  Brightness.light, //untukk proses perubahan tema
        scaffoldBackgroundColor: _isDarkTheme ? Colors.black : Colors.white,
        fontFamily: 'DM Sans', // mengatur font aplikasi
        visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur kepadatan di setiap screen
        textTheme: const TextTheme( // mengatur warna text aplikasi
          bodyMedium: TextStyle(color: textColor),
          bodySmall:  TextStyle(color: textColor)
        )
      ),
      initialRoute: '/', // inisial screen yang pertama kali muncul
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/register' : (context) => const RegisterScreen(),
      },
    );
  }
}