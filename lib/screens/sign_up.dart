import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:nba_trivia/screens/homepage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();

  _validateUser(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
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
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Please define a password with at least 6 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(left: 15), child: Text('Confirm Password')),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _repeatPassword,
                  validator: (value) {
                    if (value != _password.text) {
                      return 'the passwords don\'t match';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _validateUser(_mail.text, _password.text);
                },
                child: Text('Register'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
