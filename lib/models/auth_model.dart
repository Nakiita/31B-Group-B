// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  String? id;
  String? username;
  String? email;
  String? phone;
  String? password;

  factory UserModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => UserModel(
    id: json.id,
    username: json["username"],
    email: json["email"],
    phone: json["phoneNo"],
    password: json["password"],
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phoneNo"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phoneNo": phone,
    "password": password,
  };
}

// factory UserModel.fromFirebaseSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> json) =>
  //     UserModel(
  //       id: json.id,
  //       fullname: json["fullName"],
  //       email: json["email"],
  //       password: json["password"],
  //     );
