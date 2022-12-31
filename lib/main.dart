// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/authentication/login_screen.dart';
import 'package:myfirstproject/authentication/phone_auth/login_with_phone_number.dart';
import 'package:myfirstproject/authentication/register_screen.dart';
import 'package:myfirstproject/post/post_apartment.dart';
import 'package:myfirstproject/post/post_list_page.dart';
import 'package:myfirstproject/screen/dashboard_sceen.dart';
import 'package:myfirstproject/screen/homescreen.dart';
import 'package:myfirstproject/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTenants',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomePage.id: (context) => HomePage(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginWithPhoneNumber.id: (context) => LoginWithPhoneNumber(),
        AddProductPage.id: (context) => AddProductPage(),
        ProductPage.id: (context) => ProductPage(),
      },
    );
  }
}
