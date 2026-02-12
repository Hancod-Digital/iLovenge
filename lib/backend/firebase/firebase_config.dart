import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAN1UNPprs9iydYtCQS5gR0LZSXkva6Huw",
            authDomain: "ilovenge-46587.firebaseapp.com",
            projectId: "ilovenge-46587",
            storageBucket: "ilovenge-46587.firebasestorage.app",
            messagingSenderId: "134451030524",
            appId: "1:134451030524:web:c874cb63aa4aff90cc6a79",
            measurementId: "G-2D25WFYW2C"));
  } else {
    await Firebase.initializeApp();
  }
}
