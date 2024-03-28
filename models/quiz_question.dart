class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  
  List<String> getShuffledAnswers() {
    final List<String> shuffledAnswers = List<String>.from(answers); //list.of(answers)
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}