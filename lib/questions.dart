import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Text(
        questionText,
        style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
