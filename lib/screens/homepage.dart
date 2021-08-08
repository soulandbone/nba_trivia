import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nba_trivia/screens/trivia_page.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<String> getCurrentUser() async {
  final FirebaseUser user = await auth.currentUser();
  //final uid = user.uid;
  final mail = user.email;
  if (mail != null) {
    return mail;
  }
  return 'Anonymous';
}

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
          child: Column(
        children: [
          FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('None');
                    break;
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Text('Active and maybe waiting');
                  case ConnectionState.done:
                    return Text(snapshot.data);
                  default:
                    return Text('done');
                }
              }),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GetJson()));
                  },
                  child: Text('Trivia')),
              ElevatedButton(onPressed: () {}, child: Text('HighScores')),
              ElevatedButton(onPressed: () {}, child: Text('Your Profile')),
            ],
          ),
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
            onPressed: () {
              _logOut();
            },
          ),
        ],
      )),
    );
  }
}
