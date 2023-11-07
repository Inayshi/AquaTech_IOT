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
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('$value',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 35))
                  ],
                );
              },
              valueListenable: mqttHandler.data,
            )
          ],
        ),
      ),
    );
  }
}
