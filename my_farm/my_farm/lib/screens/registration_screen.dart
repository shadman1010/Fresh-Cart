import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; // Import this line to use Clipboard

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  // Function to generate a random password if needed
  String generatePassword() {
    return "NewRandomPassword123";
  }

  // Email validation regex
  bool isValidEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Register User API call
  Future<void> registerUser(String email, String password) async {
    var registrationUrl = 'http://10.0.2.2:3000/auth/register'; // Make sure the URL is correct

    // Check if email and password are not empty
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _isNotValidate = true;
      });
      print("Email or password cannot be empty");
      return;
    }

    // Validate email format
    if (!isValidEmail(email)) {
      setState(() {
        _isNotValidate = true;
      });
      print("Enter a valid email");
      return;
    }

    // Prepare the request body
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    // Send the request
    try {
      var response = await http.post(
        Uri.parse(registrationUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data), // Convert data to JSON format
      );

      // Check the response
      if (response.statusCode == 201) {
        // Success
        print('User registered successfully');
        setState(() {
          emailController.clear();
          passwordController.clear();
          _isNotValidate = false; // Reset error state
        });
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // Error
        setState(() {
          _isNotValidate = true;
        });
        print('Failed to register: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _isNotValidate = true;
      });
      print('Error during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF4CAF50), const Color(0xFF2E7D32)], // Green gradient colors
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CREATE YOUR ACCOUNT",
                    style: TextStyle(fontSize: 22, color: Colors.yellow[100]),
                  ),
                  SizedBox(height: 10),
                  // Email input field
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.red),
                        errorText: _isNotValidate ? "Enter a valid email" : null,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  // Password input field with copy and generate options
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: passwordController.text));
                          },
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.password),
                          onPressed: () {
                            passwordController.text = generatePassword();
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.red),
                        errorText: _isNotValidate ? "Enter a valid password" : null,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  // Register button
                  ElevatedButton(
                    onPressed: () {
                      registerUser(emailController.text, passwordController.text);
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  // Navigation to login
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Registered?"),
                          Text(" Sign In", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
