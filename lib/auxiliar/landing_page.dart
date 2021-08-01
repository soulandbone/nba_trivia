import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nba_trivia/screens/homepage.dart';
import 'package:nba_trivia/widgets/routing_button.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  loginAnonymously() async {
    await auth.signInAnonymously();
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  navigate(String route) {
    Navigator.pushNamed(context, route);
  }

  Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.purple, Colors.blue],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'NBA Quiz App',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: gradient),
        child: Column(children: [
          SizedBox(
            height: 25,
          ),
          Image(
            image: AssetImage('assets/logopng.png'),
            height: 200,
            width: 150,
          ),
          CustomButton(
            text: 'Register',
            route: '/signup',
            callback: navigate,
          ),
          SizedBox(
            width: 15,
          ),
          CustomButton(
            text: 'Login',
            route: '/login',
            callback: navigate,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: Colors.purple)))),
              onPressed: () {
                loginAnonymously();
              },
              child: Text('Log Anonymously', style: TextStyle(color: Colors.greenAccent))),
        ]),
      ),
    );
  }
}
