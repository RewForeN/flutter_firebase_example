import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                "Register for an account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 60.0),
              const TextField(),
              const Text("Name"),
              const SizedBox(height: 20.0),
              const TextField(),
              const Text("Email"),
              const SizedBox(height: 20.0),
              const TextField(),
              const Text("Password"),
              const SizedBox(height: 20.0),
              const TextField(),
              const Text("Confirm Password"),
              const SizedBox(height: 60.0),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(side: BorderSide(color: Colors.blue))),
                ),
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
