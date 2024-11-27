import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// klo ada setter (mengatur) ga ada getter(mengambil) ( bisa ), tapi klo ada getter ga ada setter ( ga bisa )

// class ThemeProvider : ChangeNotifier -> kode inheritance
class ThemeProvider extends ChangeNotifier { //extends adalah keyword pewarisan
  bool _isDarkTheme = false; //boiler plate ->sebuah setter, karena line 10 ada. klo ga ada getter berarti ini var biasa

  ThemeProvider(){
    _loadTheme();
  }

  // SETTER = pake _ (private) (pada file dimana dia didefinisikan)
  // GETTER = ga pke _ (public) (dapat diakses oleh kelas lain)
  /* - Didalam state management terdapat OOP
     - yang dipakai Stateful  dalam konsep OOP adalah Encapsulation
     - with = FP ( functional programming ) 
  */
  
  bool get isDarkTheme => _isDarkTheme;  // ini adalah GETTER, keywordnya get

  void toggleTheme(bool isDark) async {
    // yang mengatur
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners(); // dia yg kerja, ibaratnya budaknya change notifier. untuk merecord apapun yg terjadi pada apk kita
  }

  void _loadTheme()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvis operator: for defining a default value in our variable (to avoid NPE [null pointer exeption])
    // ngehasilin record, cuma butuh key
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false; // aturan tidak tertulis saat menulis type data boolen memakai is di depannya,contoh: "isDarkTheme"
    notifyListeners();
  }
}
