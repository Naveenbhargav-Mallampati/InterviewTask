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
    apiKey: 'AIzaSyDs8FsUETTqCrNVhNSmiZmnor6IAqxrl9A',
    appId: '1:873324317769:web:e78cc2d4f1a52cdd66c398',
    messagingSenderId: '873324317769',
    projectId: 'interview-f55b4',
    authDomain: 'interview-f55b4.firebaseapp.com',
    storageBucket: 'interview-f55b4.appspot.com',
    measurementId: 'G-9H7BR3Z9YR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz4y7JiCkloKUnwwBwPHc8lvpIA7IxOfU',
    appId: '1:873324317769:android:bd00174b7f0b781f66c398',
    messagingSenderId: '873324317769',
    projectId: 'interview-f55b4',
    storageBucket: 'interview-f55b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjbbvTm00-z9foFPYN7_uwf9cuHnCPxdY',
    appId: '1:873324317769:ios:dfa5fe1bc6f132e966c398',
    messagingSenderId: '873324317769',
    projectId: 'interview-f55b4',
    storageBucket: 'interview-f55b4.appspot.com',
    iosBundleId: 'com.example.interview',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjbbvTm00-z9foFPYN7_uwf9cuHnCPxdY',
    appId: '1:873324317769:ios:a32329b0ddd2e92866c398',
    messagingSenderId: '873324317769',
    projectId: 'interview-f55b4',
    storageBucket: 'interview-f55b4.appspot.com',
    iosBundleId: 'com.example.interview.RunnerTests',
  );
}
