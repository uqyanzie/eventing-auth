import 'package:eventing_app/screens/login_page.dart';
import 'package:eventing_app/screens/register_page.dart';
import 'package:eventing_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        'register': (context) => RegisterPage(),
        'home': (context) => const HomePage(),
      },
    );
  }
}
