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
        title: Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
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
                  Text('General Post'),
                  SizedBox(width: 20.0),
                  Radio(
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  Text('Job Post'),
                ],
              ),
              SizedBox(height: 20.0),
              if (_selectedOption == 1) // General Post
                TextField(
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
                      decoration: InputDecoration(
                        hintText: 'Enter Job Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _jobTitle = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Salary',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _salary = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Experience',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _experience = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
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
                    SizedBox(height: 10.0),
                  ],
                ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle post button press
                },
                child: Text('Post'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _handleImageUpload,
                child: Text('Upload Image'),
              ),
              SizedBox(height: 20.0),
              if (_uploadedImagePath != null)
                Image.asset(_uploadedImagePath!) // Display uploaded image
            ],
          ),
        ),
      ),
    );
  }
}
