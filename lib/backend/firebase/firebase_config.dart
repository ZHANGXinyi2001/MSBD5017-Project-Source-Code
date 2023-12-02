import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA4OnK1Av0DHytHlNLgkEj2wWDnolHLIA8",
            authDomain: "unilink-drfi2t.firebaseapp.com",
            projectId: "unilink-drfi2t",
            storageBucket: "unilink-drfi2t.appspot.com",
            messagingSenderId: "344918966847",
            appId: "1:344918966847:web:a551a456fc53659759ee8a"));
  } else {
    await Firebase.initializeApp();
  }
}
