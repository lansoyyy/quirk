import 'package:flutter/material.dart';

import 'package:quirk/utlis/colors.dart';
import 'package:quirk/widgets/button_widget.dart';
import 'package:quirk/widgets/textfield_widget.dart';

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
              // Sample logo
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(
                height: 75,
              ),
              TextFieldWidget(
                borderColor: primary,
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                isObscure: true,
                borderColor: primary,
                label: 'Password',
                controller: passwordController,
                showEye: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                radius: 10,
                color: primary,
                width: 300,
                label: 'Login',
                onPressed: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (context) => const HomeScreen()));
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
