import 'package:flutter/material.dart';

typedef VoidNavigate = void Function(String route); //to do , make a standard button that receives input

class CustomButton extends StatelessWidget {
  final String route;
  final String text;
  final VoidNavigate callback;

  CustomButton({this.route, this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback(route);
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.greenAccent),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: Colors.purple)))),
    );
  }
}
