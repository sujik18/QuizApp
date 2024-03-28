import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionsIndex = 0;
  
  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers); //frwding to parent class
    setState(() {
      questionsIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionsIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(
                fontSize: 21,
                color: Color.fromARGB(255, 209, 201, 213),
                fontWeight: FontWeight.bold,
                wordSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30),
            //Dynamically generating question buttons
            ...currentQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(
                answerText: e,
                onTap: () => answerQuestion(e),
              );
            })
            /*
            AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
            */
          ],
        ),
      ),
    );

    /*Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Question Screen'),
      ),
    );*/
  }
}
