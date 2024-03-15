import 'package:flutter/material.dart';
import 'package:flutter_auth0_client/flutter_auth0_client.dart';

import 'package:quirk/utlis/colors.dart';
import 'package:quirk/widgets/button_widget.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(
                height: 200,
              ),
              ButtonWidget(
                radius: 10,
                color: primary,
                width: 300,
                label: 'Login',
                onPressed: () async {
                  await FlutterAuth0Client(
                          scheme: 'https',
                          clientId: 'l6ryfkQlxJHCr7EmpsUBbo2TxlNvaFtV',
                          domain: 'dev-1x4l6wkco1ygo6sx.us.auth0.com')
                      .login()
                      .then((value) => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())));
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
