import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

RegisterModel? productModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String productModelToJson(RegisterModel? data) => json.encode(data!.toJson());

class RegisterModel {
  String? id;
  String? fullname;
  String? email;
  String? password;

  RegisterModel(
      {this.id = '',
        required this.fullname,
        required this.email,
        required this.password});

  factory RegisterModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      RegisterModel(
        id: json.id,
        fullname: json["fullName"],
        email: json["email"],
        password: json["password"],
      );


  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "email": email,
    "password": password,
  };
}