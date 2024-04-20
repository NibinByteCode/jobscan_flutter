import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jobscan/models/JobData.dart';
import '../helperclass/applyForJob.dart';

class JobDetailsPage extends StatelessWidget {
  final JobData jobData;

  const JobDetailsPage({Key? key, required this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'job${jobData.jobId}',
                  child: Image.network(
                    jobData.jobImage ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  jobData.jobTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Job Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  jobData.jobDescription,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Job Posting Date:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  jobData.jobPostingDate,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Salary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  jobData.jobSalary,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Experience:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  jobData.jobExperience,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                FutureBuilder<bool>(
                  future: _isJobApplied(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final bool isApplied = snapshot.data ?? false;
                      return ElevatedButton(
                        onPressed: isApplied ? null : () => _applyForJob(context, jobData.jobId),
                        child: Text(isApplied ? 'Applied' : 'Apply Now'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _isJobApplied() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final  event = await FirebaseDatabase.instance.reference()
            .child('Users')
            .child(currentUser.uid)
            .child('Jobs')
            .orderByValue()
            .equalTo(jobData.jobId)
            .once();
        return event.snapshot.value != null;
      }
      return false;
    } catch (e) {
      print('Error checking if job is applied: $e');
      return false;
    }
  }

  void _applyForJob(BuildContext context, String jobId) {
    final applyForJob = ApplyForJob();
    applyForJob.applyForJob(jobId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Applied for job successfully!'),
      ),
    );

    // Navigate to the home page after applying for the job
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

}
