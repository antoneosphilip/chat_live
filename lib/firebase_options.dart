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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCWNRlAnbAaIGRZbFDeNfc8dKKJ483XwdM',
    appId: '1:252188388357:web:3b09c3cfc75377f895006c',
    messagingSenderId: '252188388357',
    projectId: 'socialmedia-7efae',
    authDomain: 'socialmedia-7efae.firebaseapp.com',
    storageBucket: 'socialmedia-7efae.appspot.com',
    measurementId: 'G-49EEG2XMHV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBO62EXr-Nkz4diFrvV6i75WZk7yH68d78',
    appId: '1:252188388357:android:f78b5e9e05155a1e95006c',
    messagingSenderId: '252188388357',
    projectId: 'socialmedia-7efae',
    storageBucket: 'socialmedia-7efae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8uCxCs1tNSaAS5jOP2XZxdD8ZotqTmK4',
    appId: '1:252188388357:ios:73c5e7a0ce65447095006c',
    messagingSenderId: '252188388357',
    projectId: 'socialmedia-7efae',
    storageBucket: 'socialmedia-7efae.appspot.com',
    iosBundleId: 'com.mss.liveApp',
  );
}
