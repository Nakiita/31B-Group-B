
// import 'package:first_app_a/screens/register/register_screen.dart';
import 'package:flutter/material.dart';

import 'Register_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreentate createState() => _RegisterScreentate();
}

class _RegisterScreentate extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Please enter your email",
                  prefixIcon: Icon(Icons.accessibility_outlined),
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Please enter your password",
                  prefixIcon: Icon(Icons.visibility),
                  labelText: "Password",
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text("Don't Have an Account?"),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => RegisterScreen(),
                      ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
