import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD-JdtnybSKx9lEcy4weXsTFc29J80g6Ps",
            authDomain: "iti-cits-tests.firebaseapp.com",
            projectId: "iti-cits-tests",
            storageBucket: "iti-cits-tests.appspot.com",
            messagingSenderId: "1080321561400",
            appId: "1:1080321561400:web:e803bbc4365f76987d27cd",
            measurementId: "G-8T534FL6BS"));
  } else {
    await Firebase.initializeApp();
  }
}
