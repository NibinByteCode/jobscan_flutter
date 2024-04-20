import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import '../models/JobData.dart';

class JobDataFetcher {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  Future<List<JobData>> fetchJobData() async {
    try {
      DatabaseEvent event = await _databaseReference.child('Jobs').once();

      if (event.snapshot.value != null) {
        log(event.snapshot.value.toString());
        Map<dynamic, dynamic> jobDataMap = event.snapshot.value as Map<dynamic, dynamic>;

        List<JobData> jobList = jobDataMap.entries.map((entry) {
          // Here, ensure that the 'fromJson' constructor of JobData accepts the correct type
          JobData job = JobData.fromJson(entry.value as Map<dynamic, dynamic>);
          return job;
        }).toList();

        return jobList;
      }
    } catch (e) {
      print('Error fetching job data: $e');
      // Re-throw the exception to propagate it further if needed
      rethrow;
    }
    return [];
  }
}
