// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/HomePage.dart';
//
// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _login(BuildContext context) {
//     final String email = emailController.text;
//     final String password = passwordController.text;
//     // Dummy authentication logic (replace with your actual authentication logic)
//     if (email == 'user@example.com' && password == 'password') {
//       // Navigate to home screen after successful login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Invalid email or password'),
//         duration: Duration(seconds: 3),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => _login(context),
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/login_screen.dart
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   final String userType;
//
//   LoginScreen({required this.userType});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$userType Login'),
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to $userType Login Screen!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
// lib/pages/login_screen.dart
// lib/pages/login_screen.dart

// lib/pages/login_screen.dart
// lib/pages/login_screen.dart

// lib/pages/login_screen.dart
// import 'package:flutter/material.dart';
// import 'HomePage.dart'; // Ensure you have this import for the HomePage
// import 'RegistrationScreen.dart'; // Import your registration screen if needed
//
// class LoginScreen extends StatefulWidget {
//   final String userType;
//
//   LoginScreen({required this.userType});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String dummyFarmerEmail = 'farmer@example.com';
//   String dummyFarmerPassword = 'farmer123';
//   String dummyCustomerEmail = 'customer@example.com';
//   String dummyCustomerPassword = 'customer123';
//   bool _isNotValidate = false;
//
//   void loginUser() {
//     String email = emailController.text;
//     String password = passwordController.text;
//
//     if (email.isNotEmpty && password.isNotEmpty) {
//       // Check dummy credentials
//       bool isValid = false;
//       if (widget.userType == 'Farmer' && email == dummyFarmerEmail && password == dummyFarmerPassword) {
//         isValid = true;
//       } else if (widget.userType == 'Customer' && email == dummyCustomerEmail && password == dummyCustomerPassword) {
//         isValid = true;
//       }
//
//       if (isValid) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()), // Replace with your home page widget
//         );
//       } else {
//         setState(() {
//           _isNotValidate = true;
//         });
//       }
//     } else {
//       setState(() {
//         _isNotValidate = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Login as ${widget.userType}"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   errorText: _isNotValidate ? "Invalid credentials" : null,
//                 ),
//               ),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   errorText: _isNotValidate ? "Invalid credentials" : null,
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: loginUser,
//                 child: Text('Login'),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to registration page
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
//                 },
//                 child: Text("Don't have an account? Register here"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_farm/screens/dashboard/dashboard_screen.dart';
// import 'package:my_farm/screens/home/home_screen.dart';
// import 'package:my_farm/screens/registration_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginScreen extends StatefulWidget {
//   final String userType;
//
//   const LoginScreen({super.key, required this.userType});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool _isNotValidate = false;
//
//   void loginUser() async {
//     String email = emailController.text;
//     String password = passwordController.text;
//
//     if (email.isNotEmpty && password.isNotEmpty) {
//       try {
//         var loginBody = {
//           "email": email,
//           "password": password,
//         };
//
//
//
//         var response = await http.post(
//           Uri.parse('http://10.0.2.2:3000/auth/login'), // Backend API
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(loginBody),
//         );
//
//         if (response.statusCode == 200) {
//           var jsonResponse = jsonDecode(response.body);
//           String token = jsonResponse['token'];
//
//           // Store the JWT token in SharedPreferences
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setString('token', token); // Save the JWT token
//
//           // Navigate to the HomePage
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     const HomeScreen()), // Replace with your home page widget
//           );
//         } else {
//           setState(() {
//             _isNotValidate = true;
//           });
//           showErrorDialog('Invalid credentials');
//         }
//       } catch (e) {
//         print("Error: $e");
//         setState(() {
//           _isNotValidate = true;
//         });
//         showErrorDialog('An error occurred, please try again later');
//       }
//     } else {
//       setState(() {
//         _isNotValidate = true;
//       });
//     }
//   }
//
//   void showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Login Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Login as ${widget.userType}"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   errorText: _isNotValidate ? "Invalid credentials" : null,
//                 ),
//               ),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   errorText: _isNotValidate ? "Invalid credentials" : null,
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const DashboardScreen()),
//                   );
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to registration page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             const RegistrationScreen()), // Ensure this is the correct RegistrationScreen
//                   );
//                 },
//                 child: const Text("Don't have an account? Register here"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_farm/screens/dashboard/dashboard_screen.dart';
import 'package:my_farm/screens/home/home_screen.dart';
import 'package:my_farm/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String userType;

  const LoginScreen({super.key, required this.userType});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void loginUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        var loginBody = {
          "email": email,
          "password": password,
        };

        // Debug log to check input
        print("Sending login request with: $loginBody");

        var response = await http.post(
          Uri.parse('http://10.0.2.2:3000/auth/login'), // Backend API
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(loginBody),
        );

        // Debug log to check response
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          String token = jsonResponse['token'];

          // Store the JWT token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token); // Save the JWT token

          // Navigate to the HomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(), // Replace with your home page widget
            ),
          );
        } else {
          setState(() {
            _isNotValidate = true;
          });
          showErrorDialog('Invalid credentials');
        }
      } catch (e) {
        print("Error: $e");
        setState(() {
          _isNotValidate = true;
        });
        showErrorDialog('An error occurred, please try again later');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login as ${widget.userType}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: _isNotValidate ? "Invalid credentials" : null,
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _isNotValidate ? "Invalid credentials" : null,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginUser, // Call the loginUser function
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to registration page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  RegistrationScreen(),
                    ),
                  );
                },
                child: const Text("Don't have an account? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
