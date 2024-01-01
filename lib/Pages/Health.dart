// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  int steps = 0;
  var bldOxy;
  var bldGlu;
  var sysbldPr;
  var disysbldPr;
  var bmi;
  var btemp;
  var heartrate;
  var height;
  var weight;
  var workout;
  var data;
  HealthFactory health = HealthFactory();

  Future fetchData() async {
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
      HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.BODY_TEMPERATURE,
      HealthDataType.HEART_RATE,
      HealthDataType.HEIGHT,
      HealthDataType.WEIGHT,
      HealthDataType.WORKOUT
    ];

    var permissions = [HealthDataAccess.READ];

    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      steps = (await health.getTotalStepsInInterval(
          DateTime.december as DateTime, DateTime.now()))!;

      bldOxy =
          (health.isDataTypeAvailable(HealthDataType.HEART_RATE));

      data = (await health.getHealthDataFromTypes(DateTime.now(), DateTime.now(), types));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text("$steps"),

          ],
        ),
      ),
    );
  }
}
