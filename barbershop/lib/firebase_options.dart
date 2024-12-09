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
    apiKey: 'AIzaSyC16fhzx5BxWEL1F7nY-EWCMQteCCgdcAM',
    appId: '1:824123512831:web:1d1ce34e4c3e26009779ca',
    messagingSenderId: '824123512831',
    projectId: 'barbershop-1637a',
    authDomain: 'barbershop-1637a.firebaseapp.com',
    storageBucket: 'barbershop-1637a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSGEzjzJu6pVkNdBFHCNZoIOFaXtNJego',
    appId: '1:824123512831:android:1a4a5a4704e533189779ca',
    messagingSenderId: '824123512831',
    projectId: 'barbershop-1637a',
    storageBucket: 'barbershop-1637a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6ZYalLMWmzhr3mIq81tFen1xWNXB-jaU',
    appId: '1:824123512831:ios:e88167610f8414bc9779ca',
    messagingSenderId: '824123512831',
    projectId: 'barbershop-1637a',
    storageBucket: 'barbershop-1637a.firebasestorage.app',
    iosBundleId: 'com.example.barbershop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6ZYalLMWmzhr3mIq81tFen1xWNXB-jaU',
    appId: '1:824123512831:ios:e88167610f8414bc9779ca',
    messagingSenderId: '824123512831',
    projectId: 'barbershop-1637a',
    storageBucket: 'barbershop-1637a.firebasestorage.app',
    iosBundleId: 'com.example.barbershop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC16fhzx5BxWEL1F7nY-EWCMQteCCgdcAM',
    appId: '1:824123512831:web:6340cd75253e24059779ca',
    messagingSenderId: '824123512831',
    projectId: 'barbershop-1637a',
    authDomain: 'barbershop-1637a.firebaseapp.com',
    storageBucket: 'barbershop-1637a.firebasestorage.app',
  );
}
