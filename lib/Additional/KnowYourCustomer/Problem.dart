// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Problem extends StatefulWidget {
  const Problem({super.key});

  @override
  State<Problem> createState() => _ProblemState();
}

var Problems = {
  "Poor Sleep": false,
  "High Stress": false,
  "Anxiety Issues": false,
  "Lack of Focus": false,
  "Time Management Issues": false,
  "Emotional Imbalance": false,
};

class _ProblemState extends State<Problem> {
  bool PoorSleep = false;
  bool HighStress = false;
  bool Anxiety = false;
  bool LackOfFocus = false;
  bool TimeManagement = false;
  bool Emotional = false;
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
            "WHAT ARE BOTHERED WITH ?",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text("Poor Sleep"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: PoorSleep,
              onSelected: (val) {
                setState(() {
                  PoorSleep = !PoorSleep;
                  Problems["Poor Sleep"] = PoorSleep;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("High Stress"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              labelPadding: const EdgeInsets.all(8),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: HighStress,
              onSelected: (val) {
                setState(() {
                  HighStress = !HighStress;
                  Problems["High Stress"] = HighStress;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text("Anxiety Issues"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              labelPadding: const EdgeInsets.all(25),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: Anxiety,
              onSelected: (val) {
                setState(() {
                  Anxiety = !Anxiety;
                  Problems["Anxiety Issues"] = Anxiety;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Lack of Focus"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: LackOfFocus,
              onSelected: (val) {
                setState(() {
                  LackOfFocus = !LackOfFocus;
                  Problems["Lack of Focus"] = LackOfFocus;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text("Time Management Issues"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: TimeManagement,
              onSelected: (val) {
                setState(() {
                  TimeManagement = !TimeManagement;
                  Problems["Time Management Issues"] = TimeManagement;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Emotional Imbalance"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              labelPadding: const EdgeInsets.all(8),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: Emotional,
              onSelected: (val) {
                setState(() {
                  Emotional = !Emotional;
                  Problems["Emotional Imbalance"] = Emotional;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
