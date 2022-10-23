import 'package:flutter/material.dart';
import 'package:adib/quiz.dart';
import 'package:adib/result.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _questions = const [
    {
      'questionText': 'Let\'s start the questionnaire !',
      'answers': [
        {'text': 'OK', 'score': 0},
      ],
    },
    {
      'questionText': 'After secondary school I like study to?',
      'answers': [
        {'text': 'Pra-Diploma', 'score': 0},
        {'text': 'Diploma', 'score': 1000},
      ],
    },
    {
      'questionText':
          'I\'m motivated to study at university because I would like:',
      'answers': [
        {
          'text':
              'To gain the knowledge and skills necessary to have an impact on the world',
          'score': 25
        },
        {
          'text': 'To develop a successful career within a large organization',
          'score': 15
        },
        {
          'text':
              'To gain the tools needed to help me launch my own business project',
          'score': 20
        },
        {
          'text': 'To form a good personality with religious knowledge',
          'score': 10
        },
        {
          'text': 'To learn expand the knowlegde of art and philosophy',
          'score': 5
        },
      ],
    },
    {
      'questionText': 'I identify most with',
      'answers': [
        {'text': 'Being creative and innovative', 'score': 5},
        {'text': 'Being critical and analytical', 'score': 25},
        {'text': 'Being empathetic and sociable', 'score': 10},
        {'text': 'Being leadership and developer', 'score': 15},
        {'text': 'Being consistent and hardwork', 'score': 20},
      ],
    },
    {
      'questionText': 'When working in a team, I am the person who:',
      'answers': [
        {
          'text': 'Defines the objectives and methodology for the task',
          'score': 25
        },
        {
          'text': 'Organizes the team based on everyone personal strengths',
          'score': 10
        },
        {'text': 'Comes up with the creative ideas', 'score': 5},
        {'text': 'Collect the data and analysis', 'score': 20},
        {'text': 'Make report and finalize project', 'score': 15}
      ],
    },
    {
      'questionText': '10 years from now, I see myself:',
      'answers': [
        {
          'text':
              'Developing my own initiative which will have a positive impact on the world',
          'score': 25
        },
        {
          'text': 'Working with the latest technological advancements',
          'score': 20
        },
        {
          'text': 'Working across a range of different international contexts',
          'score': 5
        },
        {'text': 'Connecting with a wide range of individuals', 'score': 10},
        {'text': 'Be entrepreneur with many business', 'score': 15},
      ],
    },
    {
      'questionText': 'In High School I mainly focused on:',
      'answers': [
        {
          'text':
              'Analyzing complex situations and coming up with solutions for them',
          'score': 25
        },
        {
          'text': 'Creating projects which will have an impact on society',
          'score': 10
        },
        {'text': 'Solving numerical problems', 'score': 20},
        {'text': 'Represent the project', 'score': 5},
        {
          'text': 'Make the schelude and give a task for group members',
          'score': 15
        },
      ],
    },
    {
      'questionText':
          'I\'m boarding a plane and must choose only one magazine to accompany the trip, Im more likely to choose:',
      'answers': [
        {'text': 'The Beauty of languange', 'score': 5},
        {'text': 'The Economist', 'score': 15},
        {'text': 'Wired', 'score': 20},
        {'text': 'Black Hole', 'score': 25},
        {'text': 'The prophet Muhammad', 'score': 10},
      ],
    },
    {
      'questionText':
          'I have to choose to read an article, I would first read:',
      'answers': [
        {
          'text': 'How blockchain can help improve cybersecurity in your home',
          'score': 20
        },
        {'text': 'Nike reinvents their trademark image', 'score': 5},
        {'text': 'Can GDP help us measure happiness?', 'score': 15},
        {'text': 'A new start-up is stirring up Silicon Valley.', 'score': 25},
        {'text': 'Muslim not Terroris', 'score': 10},
      ],
    },
    {
      'questionText': 'I would love to work for:',
      'answers': [
        {'text': 'Nasa', 'score': 25},
        {'text': 'Pustaka', 'score': 5},
        {'text': 'JAKIM', 'score': 10},
        {'text': 'Samsung', 'score': 20},
        {'text': 'Unicef', 'score': 15},
      ],
    },
    {
      'questionText': 'I would like to learn more about:',
      'answers': [
        {'text': 'Art and philosophy', 'score': 5},
        {'text': 'History and geography', 'score': 15},
        {'text': 'Math and computing', 'score': 20},
        {'text': 'Physics and chemistry', 'score': 25},
        {'text': 'Religion and pure values ', 'score': 10},
      ],
    },
    {
      'questionText': 'I\'m most comfortable in situations where Im:',
      'answers': [
        {
          'text':
              'Making the most of technological resources to learn as quickly as possible',
          'score': 20
        },
        {'text': 'Researching and learning by myself', 'score': 25},
        {
          'text':
              'Working with other people and sharing our knowledge together.',
          'score': 10
        },
        {'text': 'Visualize the data and make a graph', 'score': 15},
        {'text': 'Give idea and gather team members', 'score': 5},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    } else {
      print('No more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // implemented build
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 32, 55, 129)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
