import 'package:flutter/material.dart';
import 'package:teste/pages/home.dart';
import 'package:teste/pages/partida.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/register_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Partida(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/register_user': (context) => RegisterUserPage(),
      },
    );
  }
}
