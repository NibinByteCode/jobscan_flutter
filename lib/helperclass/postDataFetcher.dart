import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jobscan/models/PostData.dart';

class PostDataFetcher {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<PostData>> fetchPostData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch the connections for the current user
        DatabaseEvent connectionsEvent = await _databaseReference.child('Users').child(user.uid).child('connections').once();
        Map<dynamic, dynamic>? connectionsMap = connectionsEvent.snapshot.value as Map<dynamic, dynamic>?;

        if (connectionsMap != null) {
          // Extract the userIds from connections
          List<String> userIds = connectionsMap.keys.cast<String>().toList();

          // Fetch posts for the userIds in connections
          List<PostData> postList = [];

          for (String userId in userIds) {
            DatabaseEvent postEvent = await _databaseReference.child('Posts').orderByChild('userId').equalTo(userId).once();
            Map<dynamic, dynamic>? postDataMap = postEvent.snapshot.value as Map<dynamic, dynamic>?;

            if (postDataMap != null) {
              postDataMap.forEach((key, value) {
                postList.add(PostData.fromJson(value as Map<dynamic, dynamic>));
              });
            }
          }

          return postList;
        }
      }
    } catch (e) {
      print('Error fetching post data: $e');
      // Re-throw the exception to propagate it further if needed
      rethrow;
    }
    return [];
  }
}
