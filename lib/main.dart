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
          //primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.white,
          primaryTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink),
          cardColor: Colors.deepOrange),
      home: LandingPage(),
    );
  }
}
