import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future<void> _logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
          onPressed: () {
            _logOut();
          },
        ),
      ),
    );
  }
}
