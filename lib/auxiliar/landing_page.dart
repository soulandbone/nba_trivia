import 'package:flutter/material.dart';
import 'package:nba_trivia/widgets/button_type1.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
      body: Center(
        child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
