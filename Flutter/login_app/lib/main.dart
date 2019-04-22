import 'package:flutter/material.dart';

import 'package:login_app/screens/home.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login App",
      theme: ThemeData(
        // Color
        primaryColor: Color.fromARGB(255, 255, 118, 117), // rgb(255, 118, 117)

        // Font
        primaryTextTheme: TextTheme(
          title: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
        )
      ),
      home: HomeScreen(),
    );
  }
}