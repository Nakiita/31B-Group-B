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
                Container(
                  height: deviceHeight * 0.03,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  child: const Text(
                    '',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40),
                  height: deviceHeight * 0.30,
                  child: Image.asset('assets/images/home.jpg'),
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
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Center(
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password";
                                  }
                                },
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
                                    hintText: ' Old Password ',
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
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:
                                        BorderSide(color: Colors.black12))),
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
                              child: TextFormField(
                                controller: _newPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password";
                                  }
                                },
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    filled: true,
                                    fillColor: Colors.grey.shade50,
                                    hintText: ' New Password ',
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
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:
                                        BorderSide(color: Colors.black12))),
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
                              child: TextFormField(
                                controller: _currentPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password";
                                  }
                                },
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    filled: true,
                                    fillColor: Colors.grey.shade50,
                                    hintText: ' Confirm Password ',
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
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:
                                        BorderSide(color: Colors.black12))),
                              ),
                            ),
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