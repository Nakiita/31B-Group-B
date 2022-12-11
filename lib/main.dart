// import 'package:arithmetic/screen/Page1.dart';
import 'package:arithmetic/screen/register/Register_Screen.dart';
import 'package:arithmetic/screen/register/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_class/screenshot/Homescreen.dart';
// import 'package:flutter_class/screenshot/Login/Login_screen.dart';
// import 'package:flutter_class/screenshot/Page1.dart';
// import 'package:flutter_class/screenshot/calculator.dart';
// import 'package:flutter_class/screenshot/input_demo.dart';
// import 'Layout_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry Cravings',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RegisterScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idx = 0;
  List<Widget> home = [
    // LoginScreen(),
    // InputDemo(),
    // StackViewDemo(),
    // GridViewDemo(),
    // ListViewBuilderDemo(),
    // LayoutDemo(),
    // CalculatorDemo(),
    // Homescreen(),
    Text("Email")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: Text("My Home page"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: "Email",
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Home",
            // ),
          ],
          // selectedItemColor: Colors.blue,
          // unselectedItemColor: Colors.yellow,
          currentIndex: idx,
          onTap: (index) {
            setState(() {
              idx = index;
            });
          },
        ),
        body: home[idx]
        // Container(
        //   margin: EdgeInsets.all(30.0),
        //   padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //     border: Border.all(
        //         color: Colors.black, width: 3.0, style: BorderStyle.solid),
        //     borderRadius: BorderRadius.circular(32),
        //   ),
        //   child: Text('Body element'),
        // ),
        );
  }
}
