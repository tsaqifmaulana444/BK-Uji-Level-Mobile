import 'package:bk_uji_level_remake/components/home.dart';
import 'package:bk_uji_level_remake/components/home_guru.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginGuru extends StatefulWidget {
  const LoginGuru({super.key});

  @override
  _LoginGuruState createState() => _LoginGuruState();
}

class _LoginGuruState extends State<LoginGuru> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Replace this URL with your login API endpoint
    String loginApiUrl = 'http://127.0.0.1:8000/api/login';

    Map<String, String> requestBody = {
      'email': username, // Use email instead of username for the API
      'password': password,
    };

    try {
      var response = await http.post(Uri.parse(loginApiUrl),
          body: requestBody);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        if (responseData.containsKey('error')) {
          // Login failed
          print('Login failed. ${responseData['error']}');
        } else if (responseData.containsKey('token') && responseData.containsKey('user')) {
          // Login success
          // You can process the response data here, e.g., save user data, navigate to the home screen, etc.
          String token = responseData['token'];
          Map<String, dynamic> user = responseData['user'];

          // Process user data as needed
          print('Login successful! Token: $token');
          print(user);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeGuru(user: user)),
          );
        }
      } else {
        // Handle other HTTP status codes, if necessary
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while logging in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/login.png",
                      width: 280,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Login Guru",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _buildUsernameField(),
                  const SizedBox(height: 5.0),
                  _buildPasswordField(),
                  const SizedBox(height: 30.0),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: "Username",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(Icons.person_2_rounded), // Ikonya ada di sebelah kiri form
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(Icons.lock_outline_rounded),// Ikonya ada di sebelah kiri form
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),// Memberikan margin horizontal
      child: ElevatedButton(
        onPressed: () {
          if (_usernameController.text.trim().isEmpty ||
              _passwordController.text.trim().isEmpty) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please fill in both fields")),
            );
          } else {
            _login();
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}
