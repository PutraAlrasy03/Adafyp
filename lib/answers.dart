import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
      ),
      child: RaisedButton(
        color: Color.fromARGB(255, 241, 69, 126),
        textColor: Colors.white,
        child: Text(answerText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            )),
        onPressed: selectHandler,
      ),
    );
  }
}
