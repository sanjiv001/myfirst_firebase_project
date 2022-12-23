import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/authentication/login_screen.dart';
import 'package:myfirstproject/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen"), actions: [
        IconButton(
          onPressed: () {
            auth.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          },
          icon: const Icon(Icons.logout_outlined),
        ),
        const SizedBox(
          width: 10,
        )
      ]),
    );
  }
}
