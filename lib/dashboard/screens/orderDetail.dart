import 'package:flutter/material.dart';

class OrderHistoryDetail extends StatefulWidget {
  final String address;
  final String date;
  final String total;

  OrderHistoryDetail({required this.address,required this.date,required this.total});

  @override
  _OrderHistoryDetailState createState() => _OrderHistoryDetailState();
}

class _OrderHistoryDetailState extends State<OrderHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text('Order ID: ${widget.address}'),
          // Other UI elements to display order details
        ],
      ),
    );
  }
}
