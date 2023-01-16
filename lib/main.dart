import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hunger_cravings/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hunger_cravings/dashboard/screens/home.dart';
import 'package:hunger_cravings/loading/loading.dart';
import 'package:hunger_cravings/loginpage/forgetpassword.dart';
import 'package:hunger_cravings/loginpage/register_screen.dart';
import 'package:hunger_cravings/profileScreen/ContactDetails.dart';
import 'package:hunger_cravings/delivery_address/screens/firestore/add_address.dart';
import 'package:hunger_cravings/delivery_address/screens/firestore/database.dart';
import 'package:hunger_cravings/delivery_address/screens/firestore/edit_address.dart';
import 'package:hunger_cravings/loginpage/login.dart';
import 'loading/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: "AIzaSyDZopgwT3FXAHhsTs2c78yk-dw92lnnEK8",
      //   appId: "1:350617005648:web:64921c07aa521069b4ab55",
      //   messagingSenderId: "350617005648",
      //   projectId: "my-app-name-3d643",
      // ),
      );
  // NotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        // ChangeNotifierProvider (create: (_) => CategoryViewModel()),
      ],
      child: Consumer<AuthViewModel>(builder: (context, loader, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            initialRoute: "/LoadingScreen",
            routes: {
              "/LoadingScreen": (BuildContext context) => LoadingScreen(),
              "/profile": (BuildContext context) => MyApplication(),
              "/forgotpassword": (BuildContext context) => ForgotScreen(),
              "/login": (BuildContext context) => LoginScreens(),
              "/register": (BuildContext context) => RegisterScreen(),
              "/home": (BuildContext context) => Home(),
              "/address": (BuildContext context) => AddAddressScreen(),
              "/edit-address": (BuildContext context) => EditAddressScreen(),
              "/database": (BuildContext context) => FirebaseDatabaseScreen(),
            });
      }),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hunger_cravings/dashboard/screens/home.dart';
// import 'package:hunger_cravings/loading/loading.dart';
// import 'package:hunger_cravings/loginpage/forgetpassword.dart';
// import 'package:hunger_cravings/loginpage/register_screen.dart';
// import 'package:hunger_cravings/profileScreen/ContactDetails.dart';
// import 'package:hunger_cravings/delivery_address/screens/firestore/add_address.dart';
// import 'package:hunger_cravings/delivery_address/screens/firestore/database.dart';
// import 'package:hunger_cravings/delivery_address/screens/firestore/edit_address.dart';
// import 'package:hunger_cravings/loginpage/login.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // other app settings
//         debugShowCheckedModeBanner: false,
//         initialRoute: "/LoadingScreen",
//         routes: {
//           "/LoadingScreen": (BuildContext context) => LoadingScreen(),
//           "/profile": (BuildContext context) => MyApplication(),
//           "/forgotpassword": (BuildContext context) => ForgotScreen(),
//           "/login": (BuildContext context) => LoginScreens(),
//           "/register": (BuildContext context) => RegisterScreen(),
//           "/home": (BuildContext context) => Home(),
//           "/address": (BuildContext context) => AddAddressScreen(),
//           "/edit-address": (BuildContext context) => EditAddressScreen(),
//           "/database": (BuildContext context) => FirebaseDatabaseScreen(),
//         });
//   }
// }
