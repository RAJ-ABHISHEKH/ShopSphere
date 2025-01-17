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
    apiKey: 'AIzaSyAFcAIBvb8uLm3t-qbph5E26L6Kbik-HuU',
    appId: '1:1006201707231:web:1f3d8ad19449130bc8276a',
    messagingSenderId: '1006201707231',
    projectId: 'android-d-4b996',
    authDomain: 'android-d-4b996.firebaseapp.com',
    storageBucket: 'android-d-4b996.appspot.com',
    measurementId: 'G-PK8GQYXQW6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwmL-lwPUXWBdYEsc9GJ2SWAjrhqxphzY',
    appId: '1:1006201707231:android:5534962513baa604c8276a',
    messagingSenderId: '1006201707231',
    projectId: 'android-d-4b996',
    storageBucket: 'android-d-4b996.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwo-V_o0vtexJjAQft6yPE_gXX8nW7SFI',
    appId: '1:1006201707231:ios:1b918729af1844e6c8276a',
    messagingSenderId: '1006201707231',
    projectId: 'android-d-4b996',
    storageBucket: 'android-d-4b996.appspot.com',
    androidClientId: '1006201707231-obv5gog551ui8kvrsnqtp98cg14163m9.apps.googleusercontent.com',
    iosClientId: '1006201707231-gp9q961ct6dj5k757k0rr78otradeg78.apps.googleusercontent.com',
    iosBundleId: 'com.example.androidd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwo-V_o0vtexJjAQft6yPE_gXX8nW7SFI',
    appId: '1:1006201707231:ios:1b918729af1844e6c8276a',
    messagingSenderId: '1006201707231',
    projectId: 'android-d-4b996',
    storageBucket: 'android-d-4b996.appspot.com',
    androidClientId: '1006201707231-obv5gog551ui8kvrsnqtp98cg14163m9.apps.googleusercontent.com',
    iosClientId: '1006201707231-gp9q961ct6dj5k757k0rr78otradeg78.apps.googleusercontent.com',
    iosBundleId: 'com.example.androidd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFcAIBvb8uLm3t-qbph5E26L6Kbik-HuU',
    appId: '1:1006201707231:web:1e4f21f5ba212772c8276a',
    messagingSenderId: '1006201707231',
    projectId: 'android-d-4b996',
    authDomain: 'android-d-4b996.firebaseapp.com',
    storageBucket: 'android-d-4b996.appspot.com',
    measurementId: 'G-39TEFP99MR',
  );

}