import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'WaterTempGauge.dart';
import 'AmmoniaGaugeBasic.dart';
import 'PhLevelGaugeBasic.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class GaugeBasic extends StatefulWidget {
  GaugeBasic({Key? key}) : super(key: key);

  @override
  _GaugeBasicState createState() => _GaugeBasicState();
}

class _GaugeBasicState extends State<GaugeBasic> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double tempValue = 0;
  double phValue = 0;
  double ammoniaValue = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    _database.reference().child('Sensor').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        tempValue = data['WATER_TEMP'].toDouble();
        phValue = data['PH_LEVEL'].toDouble();
        ammoniaValue = data['AMMONIA'].toDouble();
        checkAndSendNotifications();
      });
    });
  }

  void startTimer() {
    Timer.periodic(const Duration(minutes: 30), (Timer t) => saveData());
  }

  void checkAndSendNotifications() {
    if (tempValue >= 30 || phValue >= 8.0 || ammoniaValue >= 25) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 10,
        channelKey: 'aquatech_notification',
        title: 'Critical Level!',
        body: 'Your tank water condition is at a critical level.',
      ));
    }
  }

  void saveData() async {
    try {
      await _firestore.collection('sensor_data').add({
        'WATER_TEMP': tempValue,
        'PH_LEVEL': phValue,
        'AMMONIA': ammoniaValue,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Data is saved in records!');
    } catch (e) {
      print('Failed to save data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Standard View',
                style: TextStyle(
                  color: Color(0xFF0081C9),
                  fontSize: 30,
                ),
              ),
            ),
            WaterTempGauge(value: tempValue),
            PhLevelGaugeBasic(value: phValue),
            AmmoniaGaugeBasic(value: ammoniaValue),
          ],
        ),
      ),
    );
  }
}
