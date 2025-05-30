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
    apiKey: 'AIzaSyDx1F1X7VBQhjDkWQyQJVIXJucbzrVMLHI',
    appId: '1:251861519112:web:305e7fa3de37d6d119fabd',
    messagingSenderId: '251861519112',
    projectId: 'store-1b454',
    authDomain: 'store-1b454.firebaseapp.com',
    storageBucket: 'store-1b454.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR0YevSYs3Q1sM-E51rCUH6h6hfAJ9v4c',
    appId: '1:251861519112:android:5eeb5a98029bc8b719fabd',
    messagingSenderId: '251861519112',
    projectId: 'store-1b454',
    storageBucket: 'store-1b454.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkcE3m0og1mTCU1PJsZpUH_bVhnezkDBY',
    appId: '1:251861519112:ios:1100bbcbf5a00e1f19fabd',
    messagingSenderId: '251861519112',
    projectId: 'store-1b454',
    storageBucket: 'store-1b454.appspot.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkcE3m0og1mTCU1PJsZpUH_bVhnezkDBY',
    appId: '1:251861519112:ios:1100bbcbf5a00e1f19fabd',
    messagingSenderId: '251861519112',
    projectId: 'store-1b454',
    storageBucket: 'store-1b454.appspot.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDx1F1X7VBQhjDkWQyQJVIXJucbzrVMLHI',
    appId: '1:251861519112:web:5fe028a5c8f6402819fabd',
    messagingSenderId: '251861519112',
    projectId: 'store-1b454',
    authDomain: 'store-1b454.firebaseapp.com',
    storageBucket: 'store-1b454.appspot.com',
  );
}
