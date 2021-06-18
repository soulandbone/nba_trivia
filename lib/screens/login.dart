import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Future<void> _signAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e.message);
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
