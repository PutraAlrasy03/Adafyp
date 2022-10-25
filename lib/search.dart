import 'package:flutter/material.dart';
import 'package:adib/quiz.dart';
import 'package:adib/result.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    // implemented build
    return MaterialApp(
        theme: new ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 32, 55, 129)),
        debugShowCheckedModeBanner: false,
        home: Scaffold());
  }
}
