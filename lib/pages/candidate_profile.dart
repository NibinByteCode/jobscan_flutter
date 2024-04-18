import 'package:flutter/material.dart';

class CandidateProfilePage extends StatelessWidget {
  const CandidateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.only(top: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: Container(
                width: 150.0,
                height: 100.0,
                child: Image.asset('images/logo_user.png'),
              ),
            ),
            const Text(
              'User Name',
              style: TextStyle(fontSize: 20.0),
            ),
            const Text(
              'Connection Count',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle connect button press
              },
              child: const Text('Connect'),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildUserInfoRow('User Type', 'Placeholder'),
                  _buildUserInfoRow('Designation', 'Placeholder'),
                  _buildUserInfoRow('Company', 'Placeholder'),
                  _buildUserInfoRow('Email', 'Placeholder'),
                  _buildUserInfoRow('Phone Number', 'Placeholder'),
                  _buildUserInfoRow('Education', 'Placeholder'),
                  _buildUserInfoRow('Date of Birth', 'Placeholder'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
