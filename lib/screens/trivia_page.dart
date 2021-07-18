import 'package:flutter/material.dart';

class TriviaPage extends StatefulWidget {
  @override
  _TriviaPageState createState() => _TriviaPageState();
}

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
              decoration: BoxDecoration(color: Colors.orange),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: GridView(
                padding: EdgeInsets.all(10),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                children: [
                  Container(
                    color: Colors.blueGrey,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.blueAccent),
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
