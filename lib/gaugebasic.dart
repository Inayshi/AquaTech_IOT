import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'WaterTempGauge.dart';
import 'PhLevelGaugeBasic.dart';
import 'AmmoniaGaugeBasic.dart';
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

  void checkAndSendNotifications() {
    if (tempValue >= 30 || phValue >= 8.0 || ammoniaValue >= 0.25) {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaterTempGauge(value: tempValue),
            PhLevelGauge(value: phValue),
            AmmoniaGauge(value: ammoniaValue),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
