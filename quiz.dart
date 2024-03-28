import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/models/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen; ? means it can be null
  List<String> selectedAnswers = [];

  var activeScreen = 'Home-Screen';
  /*
  @override
  void initState(){
    activeScreen = HomeScreen(switchScreen);
    super.initState();
  }
  */
  void switchScreen() {
    setState(() {
      activeScreen = 'Question-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'Results-Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'Question-Screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(switchScreen);
    if (activeScreen == 'Question-Screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'Results-Screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 155, 45, 224),
                Color.fromARGB(255, 211, 50, 50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
