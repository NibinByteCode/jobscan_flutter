import 'package:flutter/material.dart';
import 'package:jobscan/models/UserData.dart';
import 'package:jobscan/pages/candidate_profile.dart';

class CandidatePage extends StatelessWidget {
  CandidatePage({Key? key}) : super(key: key);

  final List<UserData> userList = [
    UserData(
      userId: '1',
      userType: 'Candidate',
      firstName: 'John',
      lastName: 'Doe',
      dateOfBirth: '1990-05-15',
      profileImage: 'images/logo_user.png',
      phoneNumber: '123-456-7890',
      email: 'john.doe@example.com',
      companyName: 'ABC Company',
      designation: 'Software Engineer',
      educationQualification: 'Bachelor of Science in Computer Science',
      connections: {'2': 'Jane Doe'},
      postIds: ['1', '2', '3'],
      jobIds: ['1', '2'],
      connectionCount: 1,
    ),
    UserData(
      userId: '2',
      userType: 'Candidate',
      firstName: 'Jane',
      lastName: 'Doe',
      dateOfBirth: '1992-08-20',
      profileImage: 'images/logo_user.png',
      phoneNumber: '987-654-3210',
      email: 'jane.doe@example.com',
      companyName: 'XYZ Inc.',
      designation: 'UX Designer',
      educationQualification: 'Master of Fine Arts in Design',
      connections: {'1': 'John Doe'},
      postIds: ['4', '5'],
      jobIds: ['3'],
      connectionCount: 1,
    ),
    UserData(
      userId: '3',
      userType: 'Candidate',
      firstName: 'Alice',
      lastName: 'Smith',
      dateOfBirth: '1985-03-10',
      profileImage: 'images/logo_user.png',
      phoneNumber: '555-123-4567',
      email: 'alice.smith@example.com',
      companyName: 'Tech Innovators',
      designation: 'Product Manager',
      educationQualification: 'Master of Business Administration',
      connections: {},
      postIds: [],
      jobIds: [],
      connectionCount: 0,
    ),
    UserData(
      userId: '4',
      userType: 'Candidate',
      firstName: 'Bob',
      lastName: 'Johnson',
      dateOfBirth: '1978-11-25',
      profileImage: 'images/logo_user.png',
      phoneNumber: '333-222-1111',
      email: 'bob.johnson@example.com',
      companyName: 'Tech Giants',
      designation: 'Data Scientist',
      educationQualification: 'Ph.D. in Data Science',
      connections: {'5': 'Charlie Brown'},
      postIds: ['6'],
      jobIds: [],
      connectionCount: 1,
    ),
    UserData(
      userId: '5',
      userType: 'Candidate',
      firstName: 'Charlie',
      lastName: 'Brown',
      dateOfBirth: '1983-09-30',
      profileImage: 'images/logo_user.png',
      phoneNumber: '444-555-6666',
      email: 'charlie.brown@example.com',
      companyName: 'Digital Innovations',
      designation: 'Frontend Developer',
      educationQualification: 'Bachelor of Arts in Computer Science',
      connections: {'4': 'Bob Johnson'},
      postIds: ['7', '8'],
      jobIds: [],
      connectionCount: 1,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Page'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchView(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserData user = userList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidateProfilePage(user: user),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.profileImage),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.designation),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Candidates',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value) {
          // Handle search query changes
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CandidatePage(),
  ));
}
