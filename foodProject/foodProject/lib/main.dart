import 'package:flutter/material.dart';
import 'menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khana Khazana',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 16.0,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MenuScreen(),
    );
  }
}
