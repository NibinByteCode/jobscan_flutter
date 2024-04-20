import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jobscan/models/UserData.dart';

class AllUserDataFetcher {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference().child('Users');

  Future<List<UserData>> fetchAllUsers() async {
    List<UserData> allUsers = [];

    // Get current user's uid
    String currentUserUid = _auth.currentUser!.uid;

    // Fetch data from Firebase
    try {
      DatabaseEvent event  = await _databaseReference.once();
      Map<dynamic, dynamic> usersData = event.snapshot.value as Map<dynamic, dynamic>;

      usersData.forEach((key, value) {
        if (key != currentUserUid) {
          UserData userData = UserData.fromJson(value);
          allUsers.add(userData);
        }
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return allUsers;
  }
}
