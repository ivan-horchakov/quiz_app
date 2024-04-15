import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/questions_page.dart';
import 'package:quiz_app/pages/results_page.dart';
import 'package:quiz_app/pages/start_page.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-page';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-page';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-page';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartPage(switchScreen);

    if (activeScreen == 'questions-page') {
      screenWidget = QuestionsPage(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-page') {
      screenWidget = ResultsPage(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: screenWidget,
        ),
      ),
    );
  }
}
