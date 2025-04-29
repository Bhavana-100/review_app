import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:review_app/admin.dart';
import 'package:review_app/firebase_options.dart';
import 'package:review_app/signupScreen.dart';
import 'package:review_app/user.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD5_1E8wi9MBRYPMgEVOyTNCqUGvLQfQLI",
  authDomain: "reviewapp-5a4f8.firebaseapp.com",
  projectId: "reviewapp-5a4f8",
  storageBucket: "reviewapp-5a4f8.firebasestorage.app",
  messagingSenderId: "160673715344",
  appId: "1:160673715344:web:bd490d59ea056101583415",
  measurementId: "G-882LS3D09B"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = 'Admin';

  
  bool isEmailValid(String email) {
    final emailPattern =
        RegExp(r"^[a-z]+@[a-z]+\.[a-z]+$"); 
    return email.endsWith('@gmail.com') && emailPattern.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin/User Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Login"),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedRole,
                onChanged: (String? newRole) {
                  setState(() {
                    selectedRole = newRole!;
                  });
                },
                items: ['Admin', 'User']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  if (!isEmailValid(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Invalid email! Use lowercase and must end with @gmail.com.')),
                    );
                    return;
                  }

                  if (!isPasswordValid(password)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Password must be more than 6 characters.')),
                    );
                    return;
                  }

                  if (selectedRole == 'Admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPage()),
                    );
                  }
                },
                child: Text('Login'),
              ),
              Row(
                children: [
                  Text('Need an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signupscreen()),
                      );
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
