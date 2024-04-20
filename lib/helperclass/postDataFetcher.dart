import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:jobscan/models/PostData.dart';
import '../models/JobData.dart';

class PostDataFetcher {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  Future<List<PostData>> fetchPostData() async {
    try {
      DatabaseEvent event = await _databaseReference.child('Posts').once();

      if (event.snapshot.value != null) {
        log(event.snapshot.value.toString());
        Map<dynamic, dynamic> PostDataMap = event.snapshot.value as Map<dynamic, dynamic>;
        List<PostData> postList = PostDataMap.entries.map((entry) {
          // Here, ensure that the 'fromJson' constructor of JobData accepts the correct type
          PostData job = PostData.fromJson(entry.value as Map<dynamic, dynamic>);
          return job;
        }).toList();
        return postList;
      }
    } catch (e) {
      print('Error fetching job data: $e');
      // Re-throw the exception to propagate it further if needed
      rethrow;
    }
    return [];
  }
}