import 'package:flutter/material.dart';
import 'package:jobscan/models/JobData.dart';
import 'package:jobscan/pages/job_detail.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example job data
    List<JobData> jobList = [
      JobData(
        jobId: '1',
        jobTitle: 'Software Engineer',
        jobDescription: 'Developing Flutter apps',
        jobPostingDate: '2024-04-18',
        jobImage: 'images/hiring.jpg',
        userId: '123',
      ),
      JobData(
        jobId: '2',
        jobTitle: 'UX Designer',
        jobDescription: 'Creating intuitive UI/UX designs',
        jobPostingDate: '2024-04-19',
        jobImage: 'images/hiring.jpg',
        userId: '456',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs Page'),
      ),
      body: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (BuildContext context, int index) {
          JobData job = jobList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailsPage(jobData: job),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/logo_user.png'),
                    ),
                    title: const Text('UserFirstName LastName'),
                    subtitle: Text(job.jobPostingDate),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.jobTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  if (job.jobImage != null)
                    Image.asset(
                      job.jobImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
