import 'package:flutter/material.dart';
import 'package:hunger_cravings/screens/firestore/add_address.dart';
import 'package:hunger_cravings/screens/firestore/database.dart';
import 'package:hunger_cravings/screens/firestore/edit_address.dart';
import 'screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        initialRoute: "/address",
        routes: {
          "/address": (BuildContext context) => AddAddressScreen(),
          "/edit-address": (BuildContext context) => EditAddressScreen(),
          "/home-page": (BuildContext context) => HomePage(),
          "/database": (BuildContext context) => FirebaseDatabaseScreen(),
        });
  }
}
