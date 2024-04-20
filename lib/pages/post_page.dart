import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int _selectedOption = 1; // General Post by default
  String _jobTitle = '';
  String _salary = '';
  String _jobDescription = '';
  String _experience = '';
  String? _uploadedImagePath;
  String? _postContent; // Define _postContent variable

  void _handlePost(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      DatabaseReference dbRef;

      if (_selectedOption == 1) {
        // Assign _postContent based on selected option
        _postContent = _selectedOption == 1 ? _postContent : null;

        // Format date as "dd-mm-yyyy"
        String postDate = '${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year}';

        // Create a general post
        dbRef = FirebaseDatabase.instance.reference().child('Posts').push();
        await dbRef.set({
          'postId': dbRef.key.toString(),
          'postContent': _postContent ?? '',
          'userId': userId,
          'postDate': postDate,
        });
      } else if (_selectedOption == 2) {
        // Format date as "dd-mm-yyyy"
        String jobPostingDate = '${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year}';

        // Set fixed image link for job posts
        String jobImageLink = 'https://firebasestorage.googleapis.com/v0/b/jobscanflutter.appspot.com/o/jobImages%2Fhiring.jpg?alt=media&token=ef3d9405-65f0-4363-8438-e548c8c1c5c8';

        // Create a job post
        dbRef = FirebaseDatabase.instance.reference().child('Jobs').push();
        await dbRef.set({
          'jobId': dbRef.key.toString(),
          'jobTitle': _jobTitle,
          'jobDescription': _jobDescription,
          'jobPostingDate': jobPostingDate,
          'jobImage': jobImageLink,
          'userId': userId,
          'jobSalary': _salary,
          'jobExperience': _experience,
        });
      }

      // Reset fields after posting
      setState(() {
        _postContent = '';
        _jobTitle = '';
        _salary = '';
        _jobDescription = '';
        _experience = '';
        _uploadedImagePath = null;
      });

      // Navigate to home page
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text('General Post'),
                  const SizedBox(width: 20.0),
                  Radio(
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const Text('Job Post'),
                ],
              ),
              const SizedBox(height: 20.0),
              if (_selectedOption == 1) // General Post
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your post content here',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 5,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      _postContent = value;
                    });
                  },
                ),
              if (_selectedOption == 2) // Job Post
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Job Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _jobTitle = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Salary',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _salary = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Experience',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _experience = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Job Description',
                        border: OutlineInputBorder(),
                      ),
                      minLines: 5,
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          _jobDescription = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _handlePost(context); // Pass context to handlePost
                },
                child: const Text('Post'),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
