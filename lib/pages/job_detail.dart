import 'package:flutter/material.dart';
import 'package:jobscan/models/JobData.dart';

class JobDetailsPage extends StatelessWidget {
  final JobData jobData;

  const JobDetailsPage({Key? key, required this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobData.jobTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Job Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              jobData.jobDescription,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Job Posting Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              jobData.jobPostingDate,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            if (jobData.jobImage != null)
              Image.asset(
                jobData.jobImage!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your action when the user applies for the job
              },
              child: Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
