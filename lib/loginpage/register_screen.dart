
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/auth_model.dart';
import '../services/firebase_services.dart';
import 'login.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  var _isVisible = false;
  var _isVisibleConfirm = false;

  // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  // RegExp regExp =  RegExp("r'(^(?:[+0]9)?[0-9]{10,12})'");
  final formkey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text))
          .user;
      if (user != null) {
        print("User created");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("Register success")));
        Navigator.of(context).pushReplacementNamed("/home");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> createUser() async {
    final docUser = FirebaseService.db.collection('user_details').doc();
    final user = RegisterModel(
        id: docUser.id,
        fullname: username.text,
        email: email.text,
        password: password.text);

    final json = user.toJson();
    await docUser.set(json);
  }


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  height: deviceHeight * 0.20,
                  child: Image.asset('assets/images/logoo.jpg'),
                ),
                Container(
                  height: deviceHeight * 0.75,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(builder: (ctx, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [


                        SizedBox(height: constraints.maxHeight * 0.04),
                        TextFormField(
                          controller: phoneNo,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              hintText: ' Phone no ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.black12)
                              )
                          ),
                          validator: (value) {
                            if (value==null || value.isEmpty) {
                              return 'Please enter mobile number';
                            } else if (value.length<10 || value.length>10) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: constraints.maxHeight * 0.04),
                        TextFormField(
                          controller: password,
                          obscureText: _isVisible ? false : true,
                          // validator: (value){
                          //   if(value==null || value.isEmpty){
                          //     return "Please enter password";
                          //   }
                          // },

                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              hintText: ' Password ',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible= !_isVisible;
                                  });
                                },
                                icon: Icon(
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.black12)
                              )
                          ),
                        ),



                        SizedBox(height: constraints.maxHeight * 0.04),
                        TextFormField(
                          controller: confirmPassword,
                          obscureText: _isVisibleConfirm ? false : true,
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return "Please enter confirm password";
                            }else if(password.text!=confirmPassword.text){
                              return "Password and confirm password must be same";
                            }
                          },

                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              hintText: ' Confirm password ',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisibleConfirm = !_isVisibleConfirm;
                                  });
                                },
                                icon: Icon(
                                  _isVisibleConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.black12)
                              )
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
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                register();
                                createUser();
                              } else {
                                print("not success");
                              }
                            },
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
                                          LoginScreens(),
                                    ));
                                  },
                              )
                            ],
                          ),
                        ),


                      ],
                    );
                  }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}