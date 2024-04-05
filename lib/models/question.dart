class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String imageUrl;

  const Question({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
    required this.imageUrl,
  });
}
