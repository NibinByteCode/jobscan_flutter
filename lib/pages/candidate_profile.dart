import 'package:flutter/material.dart';
import 'package:jobscan/models/UserData.dart';

class CandidateProfilePage extends StatelessWidget {
  final UserData user;

  const CandidateProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(user.profileImage),
                radius: 60,
              ),
            ),
            Text(
              '${user.firstName} ${user.lastName}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              user.designation,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle connect button press
              },
              child: Text('Connect'),
            ),
            SizedBox(height: 20.0),
            _buildUserInfoRow('User Type', user.userType),
            _buildUserInfoRow('Company', user.companyName),
            _buildUserInfoRow('Email', user.email),
            _buildUserInfoRow('Phone Number', user.phoneNumber),
            _buildUserInfoRow('Education', user.educationQualification),
            _buildUserInfoRow('Date of Birth', user.dateOfBirth),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
