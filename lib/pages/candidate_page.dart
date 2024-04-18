// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandidatePage extends StatelessWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Page'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchView(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Placeholder for item count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Candidate $index'),
                  subtitle: Text('Details of Candidate $index'),
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  onTap: () {
                    // Handle list item tap
                  },
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
          prefixIcon: Icon(Icons.search),
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
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CandidatePage(),
  ));
}
