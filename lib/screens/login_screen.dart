import 'package:flutter/material.dart';
import 'package:flutter_auth0_client/flutter_auth0_client.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quirk/screens/home_screen.dart';
import 'package:quirk/utlis/colors.dart';
import 'package:quirk/widgets/button_widget.dart';
import 'package:quirk/widgets/textfield_widget.dart';
import 'package:quirk/widgets/toast_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();

  final box = GetStorage();

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
                height: 50,
              ),
              TextFieldWidget(
                isObscure: true,
                showEye: true,
                controller: username,
                label: 'Enter username',
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                radius: 10,
                color: primary,
                width: 300,
                label: 'Login',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  if (username.text == 'user1hshegsha') {
                    prefs.setBool('log', true);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  } else {
                    showToast('Invalid code');
                  }
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

  Future<Map<String, dynamic>> getUserCredentials(String accessToken) async {
    // Replace with your actual Auth0 domain
    const String domain = "dev-1x4l6wkco1ygo6sx.us.auth0.com";

    // Placeholder email address (do not use a real user's email)
    const String email = 'olanalans12345@gmail.com';

    const String url =
        'https://$domain/api/v2/users?q=email:"olanalans12345@gmail.com"&search_engine=v3';

    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
      // Content-Type might not be strictly necessary for a GET request
      // 'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = jsonDecode(response.body);
        // Remove sensitive fields like password or email before returning
        userData
            .remove('email'); // Assuming 'email' is a field you want to hide
        return userData;
      } else {
        throw Exception(
            'Failed to retrieve user credentials: ${response.reasonPhrase}');
      }
    } on Exception catch (error) {
      // Handle other potential errors here (e.g., network errors)
      print('Error retrieving user credentials: $error');
      rethrow; // Rethrow to propagate the error
    }
  }
}
