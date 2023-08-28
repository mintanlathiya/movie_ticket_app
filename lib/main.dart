import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_ticket_app/home_screen.dart';
import 'package:movie_ticket_app/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: HomeScreen(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    const storage = FlutterSecureStorage();
    Future<bool> checkLoginStatus() async {
      String? value = await storage.read(key: 'uid');
      if (value == null) {
        return false;
      }
      return true;
    }

    return FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie Ticket Booking App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == false) {
                  return const SplashScreen();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      color: Colors.white,
                      child: const Center(child: CircularProgressIndicator()));
                }
                return const HomeScreenDemo();
              },
            ),
          );
        });
  }
}
