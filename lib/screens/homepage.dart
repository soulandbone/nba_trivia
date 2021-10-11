import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nba_trivia/auxiliar/landing_page.dart';
import 'package:nba_trivia/providers/trivia_provider.dart';
import 'package:nba_trivia/screens/trivia_page.dart';
import 'package:provider/provider.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<String> getCurrentUser() async {
  final FirebaseUser user = await auth.currentUser();
  //final uid = user.uid;

  if (!user.isAnonymous) {
    return 'Welcome ' + user.email;
  }
  return 'Welcome Anonymous Mysterious User';
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _logOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
      } catch (e) {
        print(e.message);
      }
    }

    return ChangeNotifierProvider<TriviaProvider>(
        create: (context) => TriviaProvider(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
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
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GetJson()));
                            },
                            child: Text('Trivia')),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('HighScores'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Your Profile'),
                        ),
                      ),
                    ),
                  ],
                ),
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
        ));
    // );
  }
}
