import 'package:flutter/material.dart';

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

  void _handleImageUpload() {
    // Implement image upload logic
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
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your post content here',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 5,
                  maxLines: null,
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
                onPressed: _handleImageUpload,
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 20.0),
              if (_uploadedImagePath != null)
                Image.asset(_uploadedImagePath!),
              ElevatedButton(
                onPressed: () {
                  // Handle post button press
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