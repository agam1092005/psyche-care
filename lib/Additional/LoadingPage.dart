// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psychecare/HomePage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
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
                  return const HomePage();
                },
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: const Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/tea_brew.gif",
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 100,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Setting up things as per your preferences",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "DM_Serif_Display",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                  color: Color(0xFFfec8a1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
