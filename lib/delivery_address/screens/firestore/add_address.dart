import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../models/address_model.dart';


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
  bool value = false;
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
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          'ADD ADDRESS',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset('assets/images/Logo.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: AddressTitle,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black),
                            borderRadius: BorderRadius.circular(90)),
                        hintText: "Enter Address Title",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: DetailAddressDirection,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black),
                            borderRadius: BorderRadius.circular(90)),
                        hintText: "Enter Detail Address Direction",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: AlternatePhoneNumber,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black),
                            borderRadius: BorderRadius.circular(90)),
                        hintText: "Enter Alternate Phone Number",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: DefaultAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black),
                            borderRadius: BorderRadius.circular(90)),
                        hintText: "Enter Default Address",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 300.0),
                      child: Switch(
                        value: DefaultAddress.text == "true",
                        onChanged: (onChanged) {
                          setState(() {
                            value = onChanged;
                            DefaultAddress.text = value.toString();
                          });
                        },
                        activeColor: Colors.purple,
                        inactiveTrackColor: Colors.red,
                        thumbColor: MaterialStateProperty.all(value
                            ? const Color.fromARGB(245, 241, 238, 238)
                            : const Color.fromARGB(245, 51, 4, 143)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          saveAddress();
                        },
                        child: Text("ADD"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
