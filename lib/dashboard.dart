import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_ticket_app/login_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Text('Welcome User'),
            const SizedBox(height: 10),
            ElevatedButton(
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
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
