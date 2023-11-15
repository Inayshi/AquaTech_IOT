import 'dart:convert';
import 'package:aquatech/MqttClient.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  MqttHandler mqttHandler = MqttHandler();

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Data received:',
                style: TextStyle(color: Colors.black, fontSize: 25)),
            ValueListenableBuilder<Map<String, dynamic>>(
              builder: (BuildContext context, Map<String, dynamic> value,
                  Widget? child) {
                // Convert the entire map to a JSON string for display
                String jsonStr =
                    const JsonEncoder.withIndent('  ').convert(value);
                return Text(
                  jsonStr,
                  style: const TextStyle(
                      color: Colors.deepPurpleAccent, fontSize: 32),
                );
              },
              valueListenable: mqttHandler
                  .jsonData, // This is the ValueNotifier from your MqttHandler
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String jsonMessage = json.encode({"1": "1"});
          mqttHandler.publishPumpMessage(jsonMessage);
        },
        child: const Icon(Icons.send),
        tooltip: 'Publish Message',
      ),
    );
  }
}
