// ignore_for_file: file_names, use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychecare/LandingPage.dart';
import '../Additional/rounded_button.dart';

class Setting extends StatefulWidget {
  final Data;
  const Setting({super.key, required this.Data});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var goals = [];
    var problems = [];
    goals.addAll(widget.Data["Goals"].keys.toList());
    goals.retainWhere((element) => widget.Data["Goals"][element] == true);
    problems.addAll(widget.Data["Problems"].keys.toList());
    problems.retainWhere((element) => widget.Data["Problems"][element] == true);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${auth.currentUser!.photoURL}"),
                      fit: BoxFit.fitHeight),
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${auth.currentUser!.displayName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${auth.currentUser!.email}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your Goals:-",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: goals.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: const Color(0xFFfec8a1).withOpacity(0.5),
                    labelStyle: const TextStyle(color: Colors.black),
                    label: Text("${goals[index]}"),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your Problems:-",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: problems.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: const Color(0xFFfec8a1).withOpacity(0.5),
                    labelStyle: const TextStyle(color: Colors.black),
                    label: Text("${problems[index]}"),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.sizeOf(context).width / 2 - 32,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16,
                ),
              ),
            ),
            child: const Row(
              children: [
                Image(
                  image: AssetImage(
                    "assets/polaroid.png",
                  ),
                  height: 120,
                ),
                SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    "Don't forget about the past because it made you who you are, just learn to see the beauty, the beauty in your scars.",
                    style: TextStyle(
                      fontFamily: "DM_Serif_Display",
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          RoundedButton(
            onPressed: () async {
              auth.signOut();
              Navigator.of(context, rootNavigator: true).pushReplacement(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => const LandingPage(),
                ),
              );
            },
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFfec8a1),
            child: const Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
