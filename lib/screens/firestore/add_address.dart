import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:hunger_cravings/model/address_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAdressSreenState();
}

class _AddAdressSreenState extends State<AddAddressScreen> {
  TextEditingController AddressTitle = new TextEditingController();
  TextEditingController DetailAddressDirection = new TextEditingController();
  TextEditingController AlternatePhoneNumber = new TextEditingController();
  TextEditingController DefaultAddress = new TextEditingController();

  Future<void> saveAddress() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final data = Address(
        addressTitle: AddressTitle.text,
        detailAddressDirection: DetailAddressDirection.text,
        alternatePhoneNumber: AlternatePhoneNumber.text,
        isDefaultAddress: DefaultAddress.text);

    db.collection("Address").add(data.toJson()).then((value) {
      print(value.id);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Address Added Successfully")));
    });
  }

  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: AddressTitle,
            ),
            TextFormField(
              controller: DetailAddressDirection,
            ),
            TextFormField(
              controller: AlternatePhoneNumber,
            ),
            TextFormField(
              controller: DefaultAddress,
            ),
            ElevatedButton(
                onPressed: () {
                  saveAddress();
                },
                child: Text("ADD"))
          ],
        ),
      ),
    );
  }
}
