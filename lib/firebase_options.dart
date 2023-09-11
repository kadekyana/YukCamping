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
    apiKey: 'AIzaSyC6PT6xV9Kiom_hGGGqd5VMiphzxx7SFqg',
    appId: '1:45062313369:web:3baf63f9e207d653e32f08',
    messagingSenderId: '45062313369',
    projectId: 'yukcamping-a8ec2',
    authDomain: 'yukcamping-a8ec2.firebaseapp.com',
    storageBucket: 'yukcamping-a8ec2.appspot.com',
    measurementId: 'G-VSY9WE7VCY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlEShPLPhuC7CVbEBfpfAWyB7n5RSY8X8',
    appId: '1:45062313369:android:a36c61d95e167659e32f08',
    messagingSenderId: '45062313369',
    projectId: 'yukcamping-a8ec2',
    storageBucket: 'yukcamping-a8ec2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0JYgqEbcTpTq4_cFy21vp_KFzBCIUzJw',
    appId: '1:45062313369:ios:6d0f0bf91173ed66e32f08',
    messagingSenderId: '45062313369',
    projectId: 'yukcamping-a8ec2',
    storageBucket: 'yukcamping-a8ec2.appspot.com',
    iosClientId: '45062313369-qhomvjdm197s9khmbpjt59fe0esdcn2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.testing',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0JYgqEbcTpTq4_cFy21vp_KFzBCIUzJw',
    appId: '1:45062313369:ios:6d0f0bf91173ed66e32f08',
    messagingSenderId: '45062313369',
    projectId: 'yukcamping-a8ec2',
    storageBucket: 'yukcamping-a8ec2.appspot.com',
    iosClientId: '45062313369-qhomvjdm197s9khmbpjt59fe0esdcn2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.testing',
  );
}
