import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/screen/Drawer_section/drawer_header.dart';
import 'package:myfirstproject/screen/authentication/login_screen.dart';
import 'package:myfirstproject/screen/botton_navigation_bar.dart';
import 'package:myfirstproject/screen/settings/setting.dart';
import 'package:myfirstproject/widgets/utils.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HireXXo"),
        centerTitle: true,
      ),

      body: const RootApp(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const MyDrawerHeader(),
            //  Menu(),
            ListTile(
              leading: const Icon(Icons.add_moderator_rounded),
              title: const Text("Admin"),
              onTap: () => Navigator.of(context).pushNamed('/lalitpur'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications_rounded),
              title: const Text('Settings'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.notification_important_rounded),
              title: const Text(' Notifications'),
              onTap: () => Navigator.of(context).pushNamed('/addhostel'),
            ),

            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(' Send Feedback '),
              onTap: () => Navigator.of(context).pushNamed('/feedback'),
            ),

            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('LogOut'),
              onTap: () {
                auth.signOut().then((value) {
                  Utils().toastMessage("User LogOut Successfully!!!");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
            ),
          ],
        ),
      ), //Deawer
      //Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 150,
      //           child: Image.asset("assets/images/welcome.jpg",
      //               fit: BoxFit.contain),
      //         ),
      //         const Text(
      //           "Welcome Back",
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         Text("${loggedInUser.email}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         ActionChip(
      //             label: const Text("Logout"),
      //             onPressed: () {
      //               logout(context);
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
