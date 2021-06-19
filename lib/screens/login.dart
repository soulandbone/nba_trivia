import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final FirebaseAuth firebaseAuth;

  Login({@required this.firebaseAuth}); //constructor injection

  Future<void> _signAnonymously() async {
    try {
      await firebaseAuth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NBA Trivia APP'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Log in Anonymously'),
          onPressed: () {
            _signAnonymously();
          },
        ),
      ),
    );
  }
}
