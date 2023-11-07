import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttHandler with ChangeNotifier {
  final ValueNotifier<Map<String, dynamic>> jsonData = ValueNotifier<Map<String, dynamic>>({});
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient.withPort('broker.emqx.io', '95ddfec3-5e66-410b-b7b8-ddecb878fe3c', 1883);
    client.logging(on: true);
    // Set up callbacks
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    // Enable auto reconnect
    client.autoReconnect = true;

    // Keep alive period is 60 seconds
    client.keepAlivePeriod = 60;

    // Set the protocol to version 3.1.1
    client.setProtocolV311();

    client.connectionMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    try {
      await client.connect();
    } catch (e) {
      debugPrint('MQTT_LOGS::Exception during connection: $e');
      return;
    }

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      debugPrint('MQTT_LOGS::Mosquitto client connected');
    } else {
      debugPrint('MQTT_LOGS::ERROR Mosquitto client connection failed - status is ${client.connectionStatus}');
      return;
    }

    const topic = 'test/pub1';
    client.subscribe(topic, MqttQos.atMostOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
      final String messagePayload = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      try {
        final Map<String, dynamic> jsonMap = json.decode(messagePayload);
        jsonData.value = jsonMap;
        notifyListeners();
      } catch (e) {
        debugPrint('MQTT_LOGS::Error parsing JSON data: $e');
      }

      debugPrint('MQTT_LOGS::New data arrived: topic is <${c[0].topic}>, payload is <$messagePayload>');
    });
  }

  void onConnected() {
    debugPrint('MQTT_LOGS::Connected');
  }

  void onDisconnected() {
    debugPrint('MQTT_LOGS::Disconnected');
    if (client.connectionStatus!.disconnectionOrigin == MqttDisconnectionOrigin.unsolicited) {
      debugPrint('MQTT_LOGS::Unexpected disconnection; attempting to reconnect...');
      // Optionally implement additional logic to handle reconnection
      // For example, you might want to call connect() again here or set up a reconnection strategy
    }
  }


  void onSubscribed(String topic) {
    debugPrint('MQTT_LOGS::Subscribed topic: $topic');
  }

  void onSubscribeFail(String topic) {
    debugPrint('MQTT_LOGS::Failed to subscribe $topic');
  }

  void onUnsubscribed(String? topic) {
    debugPrint('MQTT_LOGS::Unsubscribed topic: $topic');
  }

  void pong() {
    debugPrint('MQTT_LOGS::Ping response client callback invoked');
  }

  bool publishMessage(String message) {
    const pubTopic = 'test/pub1';
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      try {
        client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!);
        debugPrint('MQTT_LOGS::Message published to $pubTopic');
        return true; // Indicate a successful publish operation
      } catch (e) {
        debugPrint('MQTT_LOGS::Failed to publish message: $e');
        return false; // Indicate a failed publish operation
      }
    } else {
      debugPrint('MQTT_LOGS::Cannot publish message, client is not connected');
      return false; // Indicate a failed publish operation
    }
  }


  @override
  void dispose() {
    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.disconnect();
    }
    super.dispose();
  }
}


