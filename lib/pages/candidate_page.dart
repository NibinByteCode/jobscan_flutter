import 'package:flutter/material.dart';
import 'package:jobscan/models/UserData.dart';
import 'package:jobscan/pages/candidate_profile.dart';
import '../helperclass/allUserDataFetcher.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  List<UserData> userList = [];
  String searchText = ''; // Add searchText variable here

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    AllUserDataFetcher userDataFetcher = AllUserDataFetcher();
    List<UserData> users = await userDataFetcher.fetchAllUsers();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchView(
              searchText: searchText, // Pass searchText to SearchView
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserData user = userList[index];
                return UserListItem(
                  user: user,
                  searchText: searchText, // Pass searchText to UserListItem
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
  final String searchText; // Define searchText variable here
  final ValueChanged<String> onChanged;

  const SearchView({
    Key? key,
    required this.searchText,
    required this.onChanged,
  }) : super(key: key);

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
        onChanged: onChanged, // Call onChanged callback
      ),
    );
  }
}

class UserListItem extends StatelessWidget {
  final UserData user;
  final String searchText; // Define searchText variable here

  const UserListItem({Key? key, required this.user, required this.searchText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter based on search query
    if (user.firstName.toLowerCase().contains(searchText.toLowerCase()) ||
        user.lastName.toLowerCase().contains(searchText.toLowerCase())) {
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
              backgroundImage: user.profileImage != null ? NetworkImage(user.profileImage!) : const AssetImage('/images/logo_user.png') as ImageProvider<Object>, // Use a placeholder image path if user.profileImage is null
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.designation),
          ),
      );
    } else {
      // If not matched, return an empty container
      return Container();
    }
  }
}
