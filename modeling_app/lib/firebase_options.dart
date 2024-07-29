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
    apiKey: 'AIzaSyDIg3v3mXNc-CPiX5vNDVtmHGDYzPhCxR8',
    appId: '1:985818505655:web:fe881cb3ae473c06aac832',
    messagingSenderId: '985818505655',
    projectId: 'd-model-app',
    authDomain: 'd-model-app.firebaseapp.com',
    storageBucket: 'd-model-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpdWFcQTwam24QNHladWSqtM6dp6t-wa0',
    appId: '1:985818505655:android:d6e5a38ee12d7d39aac832',
    messagingSenderId: '985818505655',
    projectId: 'd-model-app',
    storageBucket: 'd-model-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwnTFZb6BlXg48TaN2bhQEEhtUQAEUF4Q',
    appId: '1:985818505655:ios:fe7b3524a6ed2efbaac832',
    messagingSenderId: '985818505655',
    projectId: 'd-model-app',
    storageBucket: 'd-model-app.appspot.com',
    iosBundleId: 'com.example.solantTechApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwnTFZb6BlXg48TaN2bhQEEhtUQAEUF4Q',
    appId: '1:985818505655:ios:fe7b3524a6ed2efbaac832',
    messagingSenderId: '985818505655',
    projectId: 'd-model-app',
    storageBucket: 'd-model-app.appspot.com',
    iosBundleId: 'com.example.solantTechApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIg3v3mXNc-CPiX5vNDVtmHGDYzPhCxR8',
    appId: '1:985818505655:web:c667481f18296e2faac832',
    messagingSenderId: '985818505655',
    projectId: 'd-model-app',
    authDomain: 'd-model-app.firebaseapp.com',
    storageBucket: 'd-model-app.appspot.com',
  );
}
