import 'package:flutter/material.dart';
import 'package:review_app/authservice_helper.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Text("Sign up"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('email'),
                    hintText: 'Enter your email',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text('password'),
                    hintText: 'Enter your passwprd',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                   
                  },
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ));
  }
}
 // String value =
                    //     await AuthServiceHelper.createAccountWithMail(
                    //   emailController.text,
                    //   passwordController.text,
                    // );

                    // if (value == "Account created") {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Account created')),
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //         content: Text('Failed to create account: $value')),
                    //   );
                    // }