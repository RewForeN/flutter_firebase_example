import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/screens/home_screen.dart';
import 'package:flutter_firebase_example/screens/login_screen.dart';
import 'package:flutter_firebase_example/widgets/loading.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error occured."),
            );
          } else if (snapshot.hasData) {
            listenForAuthState();
            if (isUserLoggedIn) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  // Check authentication status
  void listenForAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        if (user == null) {
          isUserLoggedIn = false;
        } else {
          isUserLoggedIn = true;
        }
      });
    });
  }
}
