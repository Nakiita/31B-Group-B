import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_cravings/models/auth_model.dart';
import 'package:provider/provider.dart';

import '../repository/auth_repository.dart';
import '../viewmodel/auth_view_model.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthViewModel>(
          builder: (context, authVM, child) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('My Profile'),
              ),
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/logoo.jpg'),
                        // backgroundColor: Colors.red,
                      ),
                      Text(
                        authVM.loggedInUser!.username!.toString(),
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        authVM.loggedInUser!.email!.toString(),
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Source Sans Pro',
                            color: Colors.black54,
                            letterSpacing: 1.5,
                            wordSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.blueAccent,
                        label: Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/editProfile");
                        },
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            leading: Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Favorite",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 40),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            leading: Icon(
                              Icons.alarm_sharp,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Payment",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 40),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            leading: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Help & Support",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 40),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            leading: Icon(
                              Icons.people_alt_rounded,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Change Password",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 40),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 40),
                          ),
                        ),
                      ),

                    ],
                  ),
                ));
          }
        ));
  }
}