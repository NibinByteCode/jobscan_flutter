import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:jobscan/models/JobData.dart';

class JobDetailsPage extends StatefulWidget {
  final JobData jobData;

  const JobDetailsPage({Key? key, required this.jobData}) : super(key: key);

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    if (widget.jobData.jobImage != null) {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref(widget.jobData.jobImage!);
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        print(downloadUrl);
        imageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.jobData.jobTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Job Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.jobData.jobDescription,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Job Posting Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.jobData.jobPostingDate,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

              Image.network(
                widget.jobData.jobImage!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 20),
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
