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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'job${jobData.jobId}', // Use the same tag as in JobsPage
                  child: Image.network(
                    jobData.jobImage ?? '', // Use job image if available
                    fit: BoxFit.contain, // Try different fit options
                  ),
                ),
                SizedBox(height: 20),
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
                Text(
                  'Salary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  jobData.jobSalary,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Experience:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  jobData.jobExperience,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your action when the user applies for the job
                  },
                  child: Text('Apply Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
