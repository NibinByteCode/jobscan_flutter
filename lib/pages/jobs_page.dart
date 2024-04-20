import 'package:flutter/material.dart';
import 'package:jobscan/helperclass/jobDataFetcher.dart';
import 'package:jobscan/models/JobData.dart';
import 'package:jobscan/pages/job_detail.dart';
import '../helperclass/postDataFetcher.dart';
import '../helperclass/userDataFetcher.dart';
import '../models/UserData.dart'; // Import UserData class

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobDataFetcher = JobDataFetcher();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs Page'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          jobDataFetcher.fetchJobData(),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<JobData> jobList = snapshot.data![0] as List<JobData>;
            // Fetch user data for each job post
            return FutureBuilder(
              future: _fetchUserDataForJobs(jobList),
              builder: (context, AsyncSnapshot<Map<String, UserData>> userDataSnapshot) {
                if (userDataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (userDataSnapshot.hasError) {
                  return Center(child: Text('Error: ${userDataSnapshot.error}'));
                } else {
                  Map<String, UserData> userDataMap = userDataSnapshot.data ?? {};

                  return ListView.builder(
                    itemCount: jobList.length,
                    itemBuilder: (BuildContext context, int index) {
                      JobData job = jobList[index];
                      UserData? userData = userDataMap[job.userId];

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
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(userData?.profileImage ?? ''),
                                ),
                                title: Text('${userData?.firstName} ${userData?.lastName}'),
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
                                Image.network(
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
                  );
                }
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  // Function to fetch user data for each job post
  Future<Map<String, UserData>> _fetchUserDataForJobs(List<JobData> jobList) async {
    Map<String, UserData> userDataMap = {};

    for (JobData job in jobList) {
      if (!userDataMap.containsKey(job.userId)) {
     UserDataFetcher userDataFetcher=UserDataFetcher(userId: job.userId);
        UserData? userData = await userDataFetcher.fetchUserData();
        if (userData != null) {
          userDataMap[job.userId] = userData;
        }
      }
    }

    return userDataMap;
  }
}
