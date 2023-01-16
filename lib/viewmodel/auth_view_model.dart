import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/auth_model.dart';
import '../repository/auth_repository.dart';
import '../services/firebase_services.dart';


class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuth.currentUser;

  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser =>_loggedInUser;


  // Future<void> login(String email, String password) async {
  //   try {
  //     var response = await AuthRepository().login(email, password);
  //     _user = response.user;
  //     _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
  //     notifyListeners();
  //   } catch (err) {
  //     AuthRepository().logout();
  //     rethrow;
  //   }
  // }



  Future<void> register(UserModel user) async {
    try {
      var response = await AuthRepository().register(user);
      _user = response!.user;
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      // AuthRepository().logout();
      rethrow;
    }
  }



}