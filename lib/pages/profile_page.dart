import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.only(top: 20.0),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'User Type',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Designation',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Company',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Education',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date of Birth',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Placeholder',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle connect button press
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
