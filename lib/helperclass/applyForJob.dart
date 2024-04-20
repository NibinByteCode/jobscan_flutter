import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ApplyForJob {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference();

  Future<void> applyForJob(String jobId) async {
    try {
      // Get the current user
      User? user = _auth.currentUser;
      if (user != null) {
        String userId = user.uid;

        // Update the user's profile in the database
        await _dbRef.child('Users').child(userId).child('Jobs').push().set(jobId);
      }
    } catch (e) {
      // Handle any errors
      print('Error applying for job: $e');
    }
  }
}