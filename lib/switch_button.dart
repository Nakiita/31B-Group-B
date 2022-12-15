import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool value = false;

  bool theme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Switch(
            value: value,
            onChanged: (onChanged) {
              setState(() {
                value = onChanged;
              });
            },
            activeColor: Colors.purple,
            inactiveTrackColor: Colors.red,
            thumbColor: MaterialStateProperty.all(value
                ? const Color.fromARGB(245, 241, 238, 238)
                : const Color.fromARGB(245, 51, 4, 143)),
          ),
        ],
      )),
    );
  }
}
