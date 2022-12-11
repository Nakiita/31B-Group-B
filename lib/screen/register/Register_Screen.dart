import 'package:arithmetic/screen/register/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.30,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                height: deviceHeight * 0.75,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Register Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Username ',
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Phone Number ',
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextField(
                              obscureText: _isVisible ? false : true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Enter Your Password"),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.01,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: constraints.maxHeight * 0.02,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       TextButton(
                      //         onPressed: () {},
                      //         child: const Text(
                      //           'Forgot Password?',
                      //           style: TextStyle(color: Colors.black),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?   ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen(),
                                  ));
                                },
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
