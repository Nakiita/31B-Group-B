import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Change password",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}