import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:nba_trivia/screens/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mail = TextEditingController();

  _validateLogin(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 125,
            ),
            Container(margin: EdgeInsets.only(left: 15), child: Text('E-Mail')),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) => EmailValidator.validate(value) ? null : 'Please enter a valid email',
                controller: _mail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(margin: EdgeInsets.only(left: 15), child: Text('Password')),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _validateLogin(_mail.text, _password.text);
              },
              child: Text('Login'),
            ),
          ]),
        ),
      ),
    );
  }
}
