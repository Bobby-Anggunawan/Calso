import 'package:calso/home_page.dart';
import 'package:calso/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Mediator extends StatelessWidget {
  const Mediator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser == null){
      return LoginPage();
    }
    else{
      return HomePage();
    }
  }
}
