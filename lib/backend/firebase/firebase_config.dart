import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCKhHAn77QLbwDJH4knbBfTCyBcOZZOtVI",
            authDomain: "vini-38ae9.firebaseapp.com",
            projectId: "vini-38ae9",
            storageBucket: "vini-38ae9.firebasestorage.app",
            messagingSenderId: "703525665180",
            appId: "1:703525665180:web:69c6ac3d5322898682b059"));
  } else {
    await Firebase.initializeApp();
  }
}
