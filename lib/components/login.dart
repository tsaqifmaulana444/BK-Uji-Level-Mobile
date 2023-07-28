import 'package:bk_uji_level_remake/components/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            MaterialPageRoute(builder: (context) => Home(user: user)),
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 100.0,
              ),
              const SizedBox(height: 20.0),
              _buildUsernameField(),
              const SizedBox(height: 20.0),
              _buildPasswordField(),
              const SizedBox(height: 20.0),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
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
    );
  }
}