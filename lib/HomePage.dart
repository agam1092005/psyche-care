// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychecare/Additional/KnowYourCustomer/KnowYourCustomer.dart';
import 'Pages/Courses.dart';
import 'Pages/Diet/Diet.dart';
import 'Pages/Meditate.dart';
import 'Pages/Setting.dart';
import 'Pages/You.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  final firestore = FirebaseFirestore.instance;

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  var userData;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  fetch() async {
    if (firebaseUser != null) {
      await firestore
          .collection('Users')
          .doc(firebaseUser!.uid)
          .get()
          .then((querySnapshot) {
        userData = querySnapshot.data();
      });
    }
  }

  checkData() {
    if (userData["KYC"] != true || userData == null) {
      Navigator.of(context, rootNavigator: true).push(
        CupertinoPageRoute<bool>(
          fullscreenDialog: true,
          builder: (BuildContext context) => const KnowYourCustomer(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const You(),
      const Meditate(),
      const Diet(),
      const Courses(),
      Setting(
        Data: userData,
      ),
    ];
    setState(() {
      Future.delayed(
        const Duration(seconds: 1),
      ).then(
        (value) => checkData(),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: _onItemTap,
            currentIndex: _selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.white,
            iconSize: 25,
            selectedItemColor: const Color(0xFFfec8a1),
            unselectedItemColor: Colors.black26,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.mood_sharp),
                // ignore: deprecated_member_use
                label: ('You'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.energy_savings_leaf_outlined),
                // ignore: deprecated_member_use
                label: ('Meditate'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.emoji_food_beverage_sharp),
                // ignore: deprecated_member_use
                label: ('Diet'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.video_library_outlined),
                // ignore: deprecated_member_use
                label: ('Courses'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.settings_sharp),
                // ignore: deprecated_member_use
                label: ('Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
