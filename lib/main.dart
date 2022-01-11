import 'package:calso/chat_page.dart';
import 'package:calso/home_page.dart';
import 'package:calso/login_page.dart';
import 'package:calso/mediator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'contact_page.dart';
import 'demo/demo_chat_page.dart';
import 'demo/demo_home_page.dart';
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
        /*
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(),
        '/contact': (context) => ContactPage(),
        '/': (context) => Mediator(),*/

        '/': (context) => DemoHomePage(),
        '/chat': (context) => DemoChat(avatarURL:"https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg", name:"aa"),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}