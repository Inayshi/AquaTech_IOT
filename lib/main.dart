import 'package:awesome_notifications/awesome_notifications.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'aquatech_notification',
        channelName: 'Aquatech Notifications',
        channelDescription: 'Notifications for Aquatech',
      ),
    ],
    debug: true,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'aquatech_notification',
      title: 'Critical Level!',
      body: 'Your tank water condition is at a critical level.',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquatech',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
            ),
      ),
      home: HomePage(), // Navigate to WidgetTree
    );
  }
}
