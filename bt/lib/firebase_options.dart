import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyA791XbW7OTU8kr5QAZO37E2sOv3Iie4Qo',
    appId: '1:809678254370:web:616e1801f43cdd4cb2357b',
    messagingSenderId: '809678254370',
    projectId: 'btfyp-b453d',
    authDomain: 'btfyp-b453d.firebaseapp.com',
    storageBucket: 'btfyp-b453d.appspot.com',
    measurementId: 'G-69XM0GQ7FW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATlBf5J_UUJ0wPIcHM-AqX4QNX7YwhW6E',
    appId: '1:809678254370:android:11eb726ba9132cb0b2357b',
    messagingSenderId: '809678254370',
    projectId: 'btfyp-b453d',
    storageBucket: 'btfyp-b453d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3lbaQh_qKZrY3P5jUk-DuXEbON9w2ayo',
    appId: '1:809678254370:ios:a9fcb7c914778746b2357b',
    messagingSenderId: '809678254370',
    projectId: 'btfyp-b453d',
    storageBucket: 'btfyp-b453d.appspot.com',
    iosClientId:
        '809678254370-0d041lfh98rmuirk2igtl4gv0bq8g0ke.apps.googleusercontent.com',
    iosBundleId: 'com.example.bt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3lbaQh_qKZrY3P5jUk-DuXEbON9w2ayo',
    appId: '1:809678254370:ios:a9fcb7c914778746b2357b',
    messagingSenderId: '809678254370',
    projectId: 'btfyp-b453d',
    storageBucket: 'btfyp-b453d.appspot.com',
    iosClientId:
        '809678254370-0d041lfh98rmuirk2igtl4gv0bq8g0ke.apps.googleusercontent.com',
    iosBundleId: 'com.example.bt',
  );
}
