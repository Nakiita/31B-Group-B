import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
        initialRoute: "/home",
        routes: {
          "/home": (BuildContext context) => Home(),
          "/address": (BuildContext context) => AddAddressScreen(),
          "/edit-address": (BuildContext context) => EditAddressScreen(),
          "/database": (BuildContext context) => FirebaseDatabaseScreen(),
        });
  }
}
