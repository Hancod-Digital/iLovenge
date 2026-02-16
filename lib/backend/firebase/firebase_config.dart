import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzDqOrUEON6up6155uISfIhpYBBGrX6_A",
            authDomain: "ilovenge-edad3.firebaseapp.com",
            projectId: "ilovenge-edad3",
            storageBucket: "ilovenge-edad3.firebasestorage.app",
            messagingSenderId: "245118608879",
            appId: "1:245118608879:android:dc51cffe8921b9a0e1421a"));
  } else {
    await Firebase.initializeApp();
  }
}
