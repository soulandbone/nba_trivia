import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nba_trivia/widgets/answer_card.dart';
import 'package:nba_trivia/widgets/question_card.dart';

class GetJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/catalogue.json"),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Scaffold();
          } else {
            return TriviaPage();
          }
        });
  }
}

class TriviaPage extends StatefulWidget {
  @override
  _TriviaPageState createState() => _TriviaPageState();
}

List<String> test = ['hello', 'fuyck', 'you', 'yeah'];

class _TriviaPageState extends State<TriviaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: QuestionCard(question: 'What are you'),
              decoration: BoxDecoration(color: Colors.orange),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return AnswerCard(answer: index.toString());
                  }),
              padding: EdgeInsets.all(10),
            ),
          ),
          Expanded(
              flex: 1,
              child: (Container(
                decoration: BoxDecoration(color: Colors.amber),
              ))),
        ],
      ),
    );
  }
}
