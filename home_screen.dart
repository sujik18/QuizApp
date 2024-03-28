import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void funct() {}

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Opacity(
        //     opacity: 0.5,
        //     child: Image.asset(
        //       'assets/images/quiz-logo.png',
        //       width: 300,
        //     ),),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(
              150, 255, 255, 255), //setting white with transparent
        ),
        const SizedBox(
          height: 40,
        ),

        Text(
          'START QUIZ',
          style: GoogleFonts.openSans(fontSize: 36, color: Colors.white),
        ),
        const SizedBox(height: 10),

        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          label: const Text(
            'Start Quiz',
          ),
          icon: const Icon(Icons.arrow_right_alt),
        ),
      ]),
    );
  }
}
