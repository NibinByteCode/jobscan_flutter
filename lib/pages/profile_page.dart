import 'package:flutter/material.dart';
import '../helperclass/authhelper.dart';
import '../helperclass/userDataFetcher.dart';
import '../models/UserData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserData?> _userDataFuture;
  final AuthHelper _authHelper = AuthHelper();

  @override
  void initState() {
    super.initState();
    _userDataFuture = _fetchUserData();
  }

  Future<UserData?> _fetchUserData() async {
    String? userId = await _authHelper.getCurrentUserId();

    if (userId != null) {
      return UserDataFetcher(userId: userId).fetchUserData();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: FutureBuilder<UserData?>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.only(top: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: SizedBox(
                      width: 150.0,
                      height: 100.0,
                      child: userData?.profileImage?.isNotEmpty == true
                          ? Image.network(userData!.profileImage!)
                          : Image.asset('images/logo_user.png'),
                      ),
                    ),
                  Text(
                    '${userData?.firstName} ${userData?.lastName}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Connection Count: ${userData?.connectionCount}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  _buildUserDataRow('User Type', userData?.userType ?? 'Placeholder'),
                  _buildUserDataRow('Designation', userData?.designation ?? 'Placeholder'),
                  _buildUserDataRow('Company', userData?.companyName ?? 'Placeholder'),
                  _buildUserDataRow('Email', userData?.email ?? 'Placeholder'),
                  _buildUserDataRow('Phone Number', userData?.phoneNumber ?? 'Placeholder'),
                  _buildUserDataRow('Education', userData?.educationQualification ?? 'Placeholder'),
                  _buildUserDataRow('Date of Birth', userData?.dateOfBirth ?? 'Placeholder'),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      await _authHelper.signOut();
                      if (!context.mounted) return;
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildUserDataRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}
