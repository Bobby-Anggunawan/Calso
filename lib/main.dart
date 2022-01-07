import 'package:calso/chat_page.dart';
import 'package:calso/home_page.dart';
import 'package:calso/login_page.dart';
import 'package:calso/mediator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(),
        '/': (context) => Mediator(),
      },

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}