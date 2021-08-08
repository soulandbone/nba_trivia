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
          List myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Scaffold(
                body: Center(
              child: Text('Loading'),
            ));
          } else {
            return TriviaPage(myData);
          }
        });
  }
}

class TriviaPage extends StatefulWidget {
  final myData;

  TriviaPage(this.myData);

  @override
  _TriviaPageState createState() => _TriviaPageState(myData);
}

class _TriviaPageState extends State<TriviaPage> {
  final myData;

  _TriviaPageState(this.myData);

  String transformIndex(int index) {
    switch (index) {
      case 0:
        {
          return "a";
        }
      case 1:
        {
          return "b";
        }
      case 2:
        {
          return "c";
        }
      case 3:
        {
          return "d";
        }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    String question = '2';

    Function tapped(int index) {
      print('you have tapped $index');
      if (myData[1][question][transformIndex(index)] == myData[2][question]) {
        print('Respuesta Correcta');
      } else {
        print('Respuesta incorrecta');
      }
    }

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
              child: QuestionCard(question: myData[0][question]),
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
                    String indexAnswer = transformIndex(index);
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: AnswerCard(answer: myData[1][question][indexAnswer], correct: myData[2][question], question: question, myData: myData),

                      //onPressed: tapped(index),
                    );
                  }),
              padding: EdgeInsets.all(10),
            ),
          ),
          Expanded(
              flex: 1,
              child: (Container(
                child: Text('the Correct answer is' + myData[2][question]),
                decoration: BoxDecoration(color: Colors.amber),
              ))),
        ],
      ),
    );
  }
}
