import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/state-management/cart_provider.dart';
import 'package:mock_apps/state-management/profile_provider.dart';
import 'package:mock_apps/state-management/theme_provider.dart';
import 'package:mock_apps/state-management/whishlist_provider.dart';
import 'package:mock_apps/ui/auth/login_screen.dart';
import 'package:mock_apps/ui/auth/register_screen.dart';
import 'package:mock_apps/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => WhishlistProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ],
  child: const MockApp()));
}

class MockApp extends StatefulWidget {
  const MockApp({super.key});

  @override
  State<MockApp> createState() => _MockAppState();
}

class _MockAppState extends State<MockApp> {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false, // apabila true maka akan terdapat banner debug
        title: 'Mock App', // untuk menampilkan nama aplikasi di Task Switcher
        theme: ThemeData(
          brightness:  themeProvider.isDarkTheme ? Brightness.dark :  Brightness.light, //untukk proses perubahan tema
          scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
            ),
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
    },
    );
  }
}