// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});
  @override
  State<Gender> createState() => _GenderState();
}
String SelectedValue = "";
class _GenderState extends State<Gender> {

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isTransSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            "YOU ARE UNIQUE",
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
        FilterChip(
          elevation: 0,
          pressElevation: 1,
          selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
          label: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/Mavatar.png",
                ),
              ),
              Text(
                "Male",
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          checkmarkColor: Colors.black,
          selected: isMaleSelected,
          onSelected: (val) {
            setState(() {
              SelectedValue = "Male";
              isMaleSelected = !isMaleSelected;
              isFemaleSelected = false;
              isTransSelected = false;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FilterChip(
          elevation: 0,
          pressElevation: 1,
          selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
          label: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/Favatar.png",
                ),
              ),
              Text(
                "Female",
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          checkmarkColor: Colors.black,
          selected: isFemaleSelected,
          onSelected: (val) {
            setState(() {
              SelectedValue = "Female";
              isFemaleSelected = !isFemaleSelected;
              isMaleSelected = false;
              isTransSelected = false;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FilterChip(
          elevation: 0,
          pressElevation: 1,
          selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
          label: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/Tavatar.png",
                ),
              ),
              Text(
                "Trans",
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          checkmarkColor: Colors.black,
          selected: isTransSelected,
          onSelected: (val) {
            setState(() {
              SelectedValue = "Transgender";
              isTransSelected = !isTransSelected;
              isMaleSelected = false;
              isFemaleSelected = false;
            });
          },
        ),
      ],
    );
  }
}
