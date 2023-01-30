import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HelpandSupport extends StatefulWidget {
  const HelpandSupport({super.key});

  @override
  State<HelpandSupport> createState() => _HelpandSupportState();
}

class _HelpandSupportState extends State<HelpandSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help and support'),
        ),
        body: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 21),
                children: [
              TextSpan(text: 'hello'),
              TextSpan(
                  text: 'World',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: 'welcome! How can we help you?',
              ),
              TextSpan(
                text: 'we are available at your service',
              ),
              TextSpan(
                  text: 'flutter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 43,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ))
            ])));
  }
}
