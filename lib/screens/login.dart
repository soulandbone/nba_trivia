import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('NBA Trivia App'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 140),
              Text(
                'Full Name',
                style: TextStyle(color: Colors.red),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter your Full Name'),
              ),
              Text(
                'Email',
                style: TextStyle(color: Colors.red),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter your E-Mail'),
              ),
              Text(
                'Password',
                style: TextStyle(color: Colors.red),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter your password'),
              ),
              Text(
                'Confirm Password',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
