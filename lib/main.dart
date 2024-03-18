import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quirk/screens/home_screen.dart';
import 'package:quirk/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();

  Future<Widget> getPage() async {
    final prefs = await SharedPreferences.getInstance();

    print(prefs.getBool('log'));

    if (prefs.getBool('log') == true && prefs.getBool('log') != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quirk',
      home: FutureBuilder<Widget>(
        future: getPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return snapshot.data ??
                const SizedBox(); // Return a default widget if snapshot.data is null
          }
        },
      ),
    );
  }
}
