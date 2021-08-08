import 'package:flutter/material.dart';

//typedef VoidCallback = void Function();

class AnswerCard extends StatelessWidget {
  final String question;
  final String answer;
  final String correct;
  final List myData;
  //final VoidCallback onPressed;

  AnswerCard({
    @required this.question,
    @required this.answer,
    @required this.correct,
    @required this.myData,
    // @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Center(
        child: Text(answer),
      ),
    ));
  }
}


//if(myData[2])