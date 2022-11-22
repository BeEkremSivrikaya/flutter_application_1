import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_application_1/core/home_page.dart';
import 'package:flutter_application_1/utilities/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ogrenci uygulaması',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
    // AnaSayfa(title: 'Ogrenci Ana Sayfa'));
    // SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      anaSayfayaGit();
    }
    // anaSayfayaGit();
  }

  void anaSayfayaGit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => AnaSayfa(title: 'Ogrenci Ana Sayfa'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFirebaseInitialized
            ? ElevatedButton(
                onPressed: () async {
                  await signInWithGoogle();
                  anaSayfayaGit();
                },
                child: Text('Google Sign In'))
            : CircularProgressIndicator(),
      ),
    );
  }
}


  // try {
  //   final result = await InternetAddress.lookup('example.com');
  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     print('connected');
  //   }
  // } on SocketException catch (_) {
  //   print('not connected');
  // }