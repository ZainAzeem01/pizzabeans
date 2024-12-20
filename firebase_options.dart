// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBkDjmjjAnVw-SI0NmO981s1fvL4V9PGYY',
    appId: '1:396548432802:web:80f06a2256995e7dd208fb',
    messagingSenderId: '396548432802',
    projectId: 'pizzabeans-ee51a',
    authDomain: 'pizzabeans-ee51a.firebaseapp.com',
    storageBucket: 'pizzabeans-ee51a.firebasestorage.app',
    measurementId: 'G-QFB7DPLRWL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBe5Q0lhBIqwojbsbEASoGABIMYNVkh8A',
    appId: '1:396548432802:android:17e5515f06530cddd208fb',
    messagingSenderId: '396548432802',
    projectId: 'pizzabeans-ee51a',
    storageBucket: 'pizzabeans-ee51a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFmZ7yNonnmXpOHemYUB2oovXogoD56ZQ',
    appId: '1:396548432802:ios:a501caadaf3d61aed208fb',
    messagingSenderId: '396548432802',
    projectId: 'pizzabeans-ee51a',
    storageBucket: 'pizzabeans-ee51a.firebasestorage.app',
    iosBundleId: 'com.example.pizzabeans',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFmZ7yNonnmXpOHemYUB2oovXogoD56ZQ',
    appId: '1:396548432802:ios:a501caadaf3d61aed208fb',
    messagingSenderId: '396548432802',
    projectId: 'pizzabeans-ee51a',
    storageBucket: 'pizzabeans-ee51a.firebasestorage.app',
    iosBundleId: 'com.example.pizzabeans',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkDjmjjAnVw-SI0NmO981s1fvL4V9PGYY',
    appId: '1:396548432802:web:7ada45a20c0203fbd208fb',
    messagingSenderId: '396548432802',
    projectId: 'pizzabeans-ee51a',
    authDomain: 'pizzabeans-ee51a.firebaseapp.com',
    storageBucket: 'pizzabeans-ee51a.firebasestorage.app',
    measurementId: 'G-0J79ZWNB7R',
  );
}
