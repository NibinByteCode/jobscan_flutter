import 'package:flutter/material.dart';
import 'package:jobscan/models/PostData.dart';
import '../helperclass/postDataFetcher.dart';
import 'package:jobscan/models/UserData.dart';
import 'package:jobscan/helperclass/userDataFetcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postDataFetcher = PostDataFetcher();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<List<PostData>>(
        future: postDataFetcher.fetchPostData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<PostData> postList = snapshot.data!;
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (BuildContext context, int index) {
                PostData post = postList[index];

                return FutureBuilder<UserData?>(
                  future: _fetchUserData(post.userId),
                  builder: (context, userDataSnapshot) {
                    if (userDataSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userDataSnapshot.hasError) {
                      return Center(child: Text('Error: ${userDataSnapshot.error}'));
                    } else if (userDataSnapshot.hasData) {
                      UserData? userData = userDataSnapshot.data;
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(userData?.profileImage ?? ''),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${userData?.firstName} ${userData?.lastName}',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Post Content: ${post.postContent}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              if (post.postImage != null)
                                Image.network(
                                  post.postImage!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              const SizedBox(height: 8),
                              Text(
                                'Post Date: ${post.postDate}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text('No user data available'));
                    }
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Future<UserData?> _fetchUserData(String userId) async {
    UserDataFetcher userDataFetcher = UserDataFetcher(userId: userId);
    return await userDataFetcher.fetchUserData();
    }
}