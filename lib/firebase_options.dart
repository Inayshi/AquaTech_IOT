// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3dJOUk9CTBf7ptrPrI7UH_eImYHiG_og',
    appId: '1:149756157482:web:bd8dc230ed1b25284c6d53',
    messagingSenderId: '149756157482',
    projectId: 'aquatech-1d9b9',
    authDomain: 'aquatech-1d9b9.firebaseapp.com',
    databaseURL: 'https://aquatech-1d9b9-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'aquatech-1d9b9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0xhc3wEFaUJqWNJOxVoj_ovhq3erns-4',
    appId: '1:149756157482:android:d452f909e206050c4c6d53',
    messagingSenderId: '149756157482',
    projectId: 'aquatech-1d9b9',
    databaseURL: 'https://aquatech-1d9b9-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'aquatech-1d9b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJppIMTPQqzxaCt08gnKbPAzCuVv5BwpE',
    appId: '1:149756157482:ios:c6a6e3781f1a6d094c6d53',
    messagingSenderId: '149756157482',
    projectId: 'aquatech-1d9b9',
    databaseURL: 'https://aquatech-1d9b9-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'aquatech-1d9b9.appspot.com',
    iosBundleId: 'com.example.aquatechIot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJppIMTPQqzxaCt08gnKbPAzCuVv5BwpE',
    appId: '1:149756157482:ios:255b5f5803efa6a14c6d53',
    messagingSenderId: '149756157482',
    projectId: 'aquatech-1d9b9',
    databaseURL: 'https://aquatech-1d9b9-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'aquatech-1d9b9.appspot.com',
    iosBundleId: 'com.example.aquatechIot.RunnerTests',
  );
}
