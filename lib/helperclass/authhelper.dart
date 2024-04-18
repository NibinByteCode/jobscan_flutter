import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class AuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<User?> emailLogin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error logging in with email and password: $e");
      return null;
    }
  }
  Future<String?> getCurrentUserId() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String dateOfBirth,
    required String companyName,
    required String designation,
    required String educationQualification,
    required String userType,
    required Function(String) onError,
  }) async {
    if (password != confirmPassword) {
      onError('Passwords do not match');
      return;
    }

    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        final userData = {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
          'userType': userType,
          'dateOfBirth': dateOfBirth,
          'companyName': companyName,
          'designation': designation,
          'educationQualification': educationQualification,
          'userId': user.uid,
        };
        await _database.child('Users').child(user.uid).set(userData);
      } else {
        onError('Failed to register user');
      }
    } catch (e) {
      onError('Failed to register: $e');
    }
  }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

}
