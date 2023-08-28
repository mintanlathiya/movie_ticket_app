import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_ticket_app/change_password.dart';
import 'package:movie_ticket_app/login_screen.dart';
import 'package:movie_ticket_app/screen/home/home_screen.dart';

class HomeScreenDemo extends StatefulWidget {
  const HomeScreenDemo({super.key});

  @override
  State<HomeScreenDemo> createState() => _HomeScreenDemoState();
}

class _HomeScreenDemoState extends State<HomeScreenDemo> {
  final storage = const FlutterSecureStorage();

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    //const Profile(),
    const ChangePassword(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(66, 42, 42, 42),
        elevation: 0,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Welcome User',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent),
                  onPressed: () async => {
                        await FirebaseAuth.instance.signOut(),
                        await storage.delete(key: 'uid'),
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogIn(),
                            ),
                            (route) => false)
                      },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ))
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text('Welcome User'),
      //       ElevatedButton(
      //           onPressed: () async => {
      //                 await FirebaseAuth.instance.signOut(),
      //                 await storage.delete(key: 'uid'),
      //                 Navigator.pushAndRemoveUntil(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const LogIn(),
      //                     ),
      //                     (route) => false)
      //               },
      //           child: const Text('Logout'))
      //     ],
      //   ),
      // ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'My Profile',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Change Password',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
