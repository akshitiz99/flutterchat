import 'package:chatapp/screens/chat.dart';
import 'package:chatapp/screens/login.dart';
import 'package:chatapp/screens/registration.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "reg": (context) => MyReg(),
      "login": (context) => MyLogin(),
      "chat": (context) => MyChat(),
    },
  ));
}
