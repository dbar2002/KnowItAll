class QuizState {
  final int currentIndex;
  final int score;
  final List<int?> selectedAnswers;
  final bool isComplete;

  const QuizState({
    this.currentIndex = 0,
    this.score = 0,
    this.selectedAnswers = const [],
    this.isComplete = false,
  });

  QuizState copyWith({
    int? currentIndex,
    int? score,
    List<int?>? selectedAnswers,
    bool? isComplete,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
