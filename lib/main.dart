import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_trivia/auxiliar/landing_page.dart';
import 'package:nba_trivia/screens/login.dart';
import 'package:nba_trivia/screens/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignUp(),
        '/login': (context) => Login(),
      },
      title: 'NBA Trivia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
