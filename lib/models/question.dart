class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String category;
  final String difficulty;
  final String? explanation;

  const Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.category,
    this.difficulty = 'medium',
    this.explanation,
  });

  String get correctAnswer => options[correctIndex];

  bool isCorrect(int selectedIndex) => selectedIndex == correctIndex;
}
