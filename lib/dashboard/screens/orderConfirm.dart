import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  bool _isChecked = false;
  double _totalCost = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              // children: <Widget>[
              //   Text('Total Cost: $_totalCost'), // display the total cost
              //   CheckboxListTile(
              //     title: Text('Accept Terms and Conditions'),
              //     value: _isChecked,
              //     onChanged: (bool value) {
              //       setState(() {
              //         _isChecked = value;
              //       });
              //     },
              //   ),
              //   RaisedButton(
              //     child: Text('Confirm Order'),
              //     onPressed: _isChecked ? _confirmOrder : null, // only allow button press if checkbox is checked
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmOrder() {
  }
}