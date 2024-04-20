import 'package:flutter/material.dart';
import 'package:jobscan/pages/candidate_page.dart';
import 'package:jobscan/pages/home_page.dart';
import 'package:jobscan/pages/jobs_page.dart';
import 'package:jobscan/pages/login.dart';
import 'package:jobscan/pages/post_page.dart';
import 'package:jobscan/pages/profile_page.dart';
import 'package:jobscan/pages/signup.dart';
import 'package:jobscan/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Job scan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home' : (context) => const MyHomePage(),
         '/signup': (context) => const SignUpPage(),
         '/login': (context) => LoginPage(),
        // '/home': (context) => _checkAuthAndNavigate(HomePage(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped)),
        // '/profile': (context) => _checkAuthAndNavigate(ProfilePage(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped)),
        // '/candidate': (context) => _checkAuthAndNavigate(CandidatePage(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped)),
        // '/joblist': (context) => _checkAuthAndNavigate(JobListPage(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped)),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const JobsPage(),
    PostPage(),
    CandidatePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Scan'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blue,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work,color: Colors.blue,),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit,color: Colors.blue,),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts,color: Colors.blue,),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.blue,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}




