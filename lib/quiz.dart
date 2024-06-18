import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/gradient.dart';
import 'package:quiz_app/ques_screen.dart';
import 'results_scr.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScr = 'homeScreen';

  void switchScr() {
    setState(() {
      activeScr = 'qScreen';
    });
  }

  void retake() {
    setState(() {
      selectedAnswer = [];
      activeScr = 'homeScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScr = 'resultScr';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screen = GradientC(switchScr);

    if (activeScr == 'qScreen') {
      screen = QueScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScr == 'resultScr') {
      screen = ResultsScr(
        ansList: selectedAnswer,
        onRetake: retake,
      );
    }

    if (activeScr == 'homeScreen') {
      screen = GradientC(switchScr);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(248, 58, 16, 116),
              Color.fromARGB(255, 118, 26, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screen,
        ),
      ),
    );
  }
}
