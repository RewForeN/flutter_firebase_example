import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                "Log into your account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 60.0),
              TextField(controller: emailAddressController),
              const Text("Email"),
              const SizedBox(height: 20.0),
              TextField(controller: passwordController),
              const Text("Password"),
              const SizedBox(height: 60.0),
              TextButton(
                onPressed: () {
                  AuthenticateEmailAndPassword();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(side: BorderSide(color: Colors.blue))),
                ),
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text("Don't have an account?"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void AuthenticateEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddressController.text,
        password: passwordController.text,
      );
      print("User signed in!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
