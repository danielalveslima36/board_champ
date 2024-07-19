import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste/pages/home.dart';
import 'package:teste/pages/partida.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/register_user.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'hUusz9k1Kb4GBEIGcT1YvxxsY7F8hVv23CN2mDXY';
  const keyClientKey = 'sfHcqKGnj4TyTwmNykzaQfH0xvlOX8lRQAhEf4hW';
  const keyParseServerUrl = 'https://parseapi.back4app.com/parse';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

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
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/register_user': (context) => RegisterUserPage(),
      },
    );
  }
}
