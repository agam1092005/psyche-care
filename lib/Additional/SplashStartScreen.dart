// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psychecare/HomePage.dart';
import 'package:psychecare/LandingPage.dart';

class SplashStartScreen extends StatefulWidget {
  const SplashStartScreen({super.key});

  @override
  State<SplashStartScreen> createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
      Timer(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionsBuilder: (context, animation, animationTime, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return (auth.currentUser == null) ? const LandingPage() : const HomePage();
            },
          ),
        )
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/snake_pink.png"),
            ),
            Text("PSYCHE-CARE"),
          ],
        ),
      ),
    );
  }
}
