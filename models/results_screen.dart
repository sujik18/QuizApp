import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    // all elements in dart are objects at end
    //allows all kinds of problem
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':
            questions[i].answers[0], //quest data are set as option 1 is answer
        'chosen_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length; //where returns a list of elements that satisfy the condition

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Text(
              'Great, QUIZ Completed !!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 248, 240, 240),
              ),
            ),
            Text(
              'You answered $numTotalQuestions questions and got $numCorrectQuestions correct.',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 249, 239, 239),
              ),
            ),

            const SizedBox(
              height: 30,
            ), //blank space

            QuestionsSummary(summaryData),
            //const Text('List of answers and questions...'),

            const SizedBox(
              height: 30,
            ),

            //adding a refresh icon before restart button
            OutlinedButton.icon(
              onPressed: onRestart, 
              /* 
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),*/
              icon: const Icon(Icons.refresh, color: Color.fromARGB(255, 236, 227, 227)), 
              label: const Text('Restart Quiz', style:TextStyle(color: Color.fromARGB(255, 246, 239, 239))),
            )
          ],
        ),
      ),
    );
  }
}
