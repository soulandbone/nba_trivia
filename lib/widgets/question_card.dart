import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  QuestionCard({@required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Center(
        child: Text(question),
      )),
    );
  }
}
