// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(
                16,
              ),

              child: Text(
                "SMILE :)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFfec8a1),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/monstera.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '“Peace begins with a smile.”',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "DM_Serif_Display",
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              '~Mother Teresa',
              style: TextStyle(
                fontSize: 16,
                fontFamily: "DM_Serif_Display",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
  }
}
