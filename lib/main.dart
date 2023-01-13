import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hunger_cravings/dashboard/screens/home.dart';
import 'package:hunger_cravings/loginpage/forgetpassword.dart';
import 'package:hunger_cravings/screens/firestore/add_address.dart';
import 'package:hunger_cravings/screens/firestore/database.dart';
import 'package:hunger_cravings/screens/firestore/edit_address.dart';
import 'package:hunger_cravings/loginpage/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // other app settings
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        routes: {
          "/forgotpassword": (BuildContext context) => ForgotScreen(),
          "/login": (BuildContext context) => LoginScreens(),
          "/home": (BuildContext context) => Home(),
          "/address": (BuildContext context) => AddAddressScreen(),
          "/login": (BuildContext context) => LoginScreens(),

          "/forgot": (BuildContext context) => ForgotScreen(),
          "/edit-address": (BuildContext context) => EditAddressScreen(),
          "/database": (BuildContext context) => FirebaseDatabaseScreen(),
        });
  }
}
