import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;

  AnswerCard({@required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Center(
            child: InkWell(
          child: Text(answer),
          onTap: () {},
        )),
      ),
    );
  }
}
