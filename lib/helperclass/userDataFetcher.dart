import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

import '../models/UserData.dart';



class UserDataFetcher {
  final String userId;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  UserDataFetcher({required this.userId});

  Future<UserData?> fetchUserData() async {
    try {
      DatabaseEvent event = await _databaseReference.child('Users').child(userId).once();

      if (event.snapshot != null) {
        print('333333333333333333333333');
        DataSnapshot snapshot = event.snapshot!;
        Map<dynamic, dynamic>? userDataMap = snapshot.value as Map<dynamic, dynamic>?;

        if (userDataMap != null) {
          return UserData.fromJson(userDataMap);
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }
}
