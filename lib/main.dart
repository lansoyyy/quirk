import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quirk/screens/home_screen.dart';
import 'package:quirk/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quirk',
      home: box.read('hasLoggedIn') != null || box.read('hasLoggedIn') == true
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
