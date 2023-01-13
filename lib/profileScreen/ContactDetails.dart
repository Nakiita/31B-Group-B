import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My Profile'),
          ),
            backgroundColor: Colors.black,
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
                    'Rajesh Prasad Sah',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'rajeshh@gmail.com',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.white54,
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
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Favorite",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.alarm_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Order History",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Help & Support",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Invite a friend",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),

                ],
              ),
            )));
  }
}