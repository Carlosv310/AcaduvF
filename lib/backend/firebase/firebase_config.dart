import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCWYsARZHrJ1x7xGuOjBMGJGyWJ8v_XWQI",
            authDomain: "acadu-ada31.firebaseapp.com",
            projectId: "acadu-ada31",
            storageBucket: "acadu-ada31.appspot.com",
            messagingSenderId: "22026485479",
            appId: "1:22026485479:web:61cbf7f11b406e33b86c42",
            measurementId: "G-6PYCHDEYEV"));
  } else {
    await Firebase.initializeApp();
  }
}
