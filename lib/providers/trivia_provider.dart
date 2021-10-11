import 'package:flutter/cupertino.dart';

class TriviaProvider extends ChangeNotifier {
  String value = 'hello';

  void changeColor(index) {
    index = 5;
    notifyListeners();
  }
}
