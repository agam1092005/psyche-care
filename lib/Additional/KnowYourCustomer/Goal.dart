// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  const Goal({super.key});

  @override
  State<Goal> createState() => _GoalState();
}

var Goals = {
  "Relax": false,
  "Better Sleep": false,
  "Fitness": false,
  "Productivity Boost": false,
  "Improved Concentration": false,
  "Work-Life Balance": false,
  "Spiritual Exploration": false,
};

class _GoalState extends State<Goal> {
  bool Relax = false;
  bool BetterSleep = false;
  bool Fitness = false;
  bool ProductivityBoost = false;
  bool ImprovedConcentration = false;
  bool WorkLifeBalance = false;
  bool SpiritualExploration = false;
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
            "WHAT DO YOU WANT TO ACHIEVE ?",
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
              label: const Text("Relax"),
              labelPadding: const EdgeInsets.all(20),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selected: Relax,
              onSelected: (val) {
                setState(() {
                  Relax = !Relax;
                  Goals["Relax"] = Relax;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Better Sleep"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: BetterSleep,
              onSelected: (val) {
                setState(() {
                  BetterSleep = !BetterSleep;
                  Goals["Better Sleep"] = BetterSleep;
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
              label: const Text("Fitness"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: Fitness,
              onSelected: (val) {
                setState(() {
                  Fitness = !Fitness;
                  Goals["Fitness"] = Fitness;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Productivity Boost"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              labelPadding: const EdgeInsets.all(8),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: ProductivityBoost,
              onSelected: (val) {
                setState(() {
                  ProductivityBoost = !ProductivityBoost;
                  Goals["Productivity Boost"] = ProductivityBoost;
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
              label: const Text("Improved Concentration"),
              labelPadding: const EdgeInsets.all(16),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: ImprovedConcentration,
              onSelected: (val) {
                setState(() {
                  ImprovedConcentration = !ImprovedConcentration;
                  Goals["Improved Concentration"] = ImprovedConcentration;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Work-Life Balance"),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.black),
              selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
              selected: WorkLifeBalance,
              onSelected: (val) {
                setState(() {
                  WorkLifeBalance = !WorkLifeBalance;
                  Goals["Work-Life Balance"] = WorkLifeBalance;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ChoiceChip(
          label: const Text("Spiritual Exploration"),
          backgroundColor: Colors.grey,
          labelStyle: const TextStyle(color: Colors.black),
          selectedColor: const Color(0xFFfec8a1).withOpacity(0.5),
          selected: SpiritualExploration,
          onSelected: (val) {
            setState(() {
              SpiritualExploration = !SpiritualExploration;
              Goals["Spiritual Exploration"] = SpiritualExploration;
            });
          },
        ),
      ],
    );
  }
}
