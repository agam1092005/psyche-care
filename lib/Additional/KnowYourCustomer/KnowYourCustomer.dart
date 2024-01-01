// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychecare/Additional/LoadingPage.dart';
import 'Problem.dart';
import 'Gender.dart';
import 'Goal.dart';
import 'Intro.dart';

class KnowYourCustomer extends StatefulWidget {
  const KnowYourCustomer({super.key});

  @override
  State<KnowYourCustomer> createState() => _KnowYourCustomerState();
}

class _KnowYourCustomerState extends State<KnowYourCustomer> {
  late PageController _pagecontroller;

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 2,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverElevation: 2,
            backgroundColor: const Color(0xFFfec8a1),
            child: const Icon(
              Icons.navigate_next_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              if (_pagecontroller.page == 3) {
                final firestore = FirebaseFirestore.instance;
                final FirebaseAuth auth = FirebaseAuth.instance;
                firestore.collection('Users').doc(auth.currentUser!.uid).set(
                  {
                    "KYC": true,
                    "Gender": SelectedValue,
                    "Goals": Goals,
                    "Problems": Problems,
                  },
                );
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) => const LoadingPage(),
                  ),
                );
              } else {
                _pagecontroller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
          ),
          body: PageView(
            controller: _pagecontroller,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: const [
              Intro(),
              Gender(),
              Goal(),
              Problem(),
            ],
          ),
        ),
      ),
    );
  }
}
