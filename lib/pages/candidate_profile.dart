import 'package:flutter/material.dart';
import 'package:jobscan/models/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CandidateProfilePage extends StatefulWidget {
  final UserData user;

  const CandidateProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _CandidateProfilePageState createState() => _CandidateProfilePageState();
}

class _CandidateProfilePageState extends State<CandidateProfilePage> {
  late bool isConnected;
  late DatabaseReference connectionsRef;
  late String currentUserID;
  late DatabaseReference currentUserRef;
  late DatabaseReference otherUserRef;


  @override
  void initState() {
    super.initState();
    isConnected = false;
    currentUserID = FirebaseAuth.instance.currentUser!.uid;
    connectionsRef = FirebaseDatabase.instance.reference().child('Users').child(currentUserID).child('connections');
    currentUserRef = FirebaseDatabase.instance.reference().child('Users').child(currentUserID);
    otherUserRef=FirebaseDatabase.instance.reference().child('Users').child(widget.user.userId);
    checkIfConnected();
  }

  Future<void> checkIfConnected() async {
    DatabaseEvent event = await connectionsRef.once();
    Map<dynamic, dynamic> connections = event.snapshot.value as Map<dynamic, dynamic>;
    if (connections != null && connections.containsKey(widget.user.userId)) {
      setState(() {
        isConnected = true;
      });
    }
  }

  Future<void> connectUsers() async {
    // Add the other user to the connections list of the current user
    await currentUserRef.child('connections').update({widget.user.userId: ""});

    // Increment the connection count of the current user
    DatabaseEvent currentUserEvent = await currentUserRef.child('connectionCount').once();
    int currentCount = currentUserEvent.snapshot.value as int ?? 0;
    await currentUserRef.child('connectionCount').set(currentCount + 1);

    // Add the current user to the connections list of the other user
    await otherUserRef.child('connections').update({currentUserID: ""});

    // Increment the connection count of the other user
    DatabaseEvent otherUserEvent = await otherUserRef.child('connectionCount').once();
    int otherUserCount = otherUserEvent.snapshot.value as int ?? 0;
    await otherUserRef.child('connectionCount').set(otherUserCount + 1);

    setState(() {
      isConnected = true;
    });
  }

  Future<void> disconnectUsers() async {
    // Remove the other user from the connections list of the current user
    await currentUserRef.child('connections').child(widget.user.userId).remove();

    // Decrement the connection count of the current user
    DatabaseEvent currentUserEvent = await currentUserRef.child('connectionCount').once();
    int currentCount = currentUserEvent.snapshot.value as int ?? 0;
    await currentUserRef.child('connectionCount').set(currentCount > 0 ? currentCount - 1 : 0);

    // Remove the current user from the connections list of the other user
    await otherUserRef.child('connections').child(currentUserID).remove();

    // Decrement the connection count of the other user
    DatabaseEvent otherUserEvent = await otherUserRef.child('connectionCount').once();
    int otherUserCount = otherUserEvent.snapshot.value as int ?? 0;
    await otherUserRef.child('connectionCount').set(otherUserCount > 0 ? otherUserCount - 1 : 0);

    setState(() {
      isConnected = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.profileImage),
                radius: 60,
              ),
            ),
            Text(
              '${widget.user.firstName} ${widget.user.lastName}',
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.user.designation,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: isConnected ? disconnectUsers : connectUsers,
              child: Text(isConnected ? 'Disconnect' : 'Connect'),
            ),
            const SizedBox(height: 20.0),
            _buildUserInfoRow('User Type', widget.user.userType),
            _buildUserInfoRow('Company', widget.user.companyName),
            _buildUserInfoRow('Email', widget.user.email),
            _buildUserInfoRow('Phone Number', widget.user.phoneNumber),
            _buildUserInfoRow('Education', widget.user.educationQualification),
            _buildUserInfoRow('Date of Birth', widget.user.dateOfBirth),
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
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10.0),
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
