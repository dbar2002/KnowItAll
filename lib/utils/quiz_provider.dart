import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';
import '../models/quiz_state.dart';
import '../data/question_bank.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];
  QuizState _state = const QuizState();
  int _highScore = 0;
  int _totalQuizzesPlayed = 0;
  String? _selectedCategory;

  // ── Getters ────────────────────────────────────────────
  List<Question> get questions => _questions;
  QuizState get state => _state;
  int get highScore => _highScore;
  int get totalQuizzesPlayed => _totalQuizzesPlayed;
  String? get selectedCategory => _selectedCategory;

  Question get currentQuestion => _questions[_state.currentIndex];
  int get totalQuestions => _questions.length;
  bool get isLastQuestion => _state.currentIndex >= _questions.length - 1;
  double get progress => (_state.currentIndex + 1) / _questions.length;
  int? get currentAnswer =>
      _state.currentIndex < _state.selectedAnswers.length
          ? _state.selectedAnswers[_state.currentIndex]
          : null;

  QuizProvider() {
    _loadStats();
  }

  // ── Stats persistence ──────────────────────────────────
  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    _highScore = prefs.getInt('highScore') ?? 0;
    _totalQuizzesPlayed = prefs.getInt('totalQuizzesPlayed') ?? 0;
    notifyListeners();
  }

  Future<void> _saveStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScore', _highScore);
    await prefs.setInt('totalQuizzesPlayed', _totalQuizzesPlayed);
  }

  // ── Quiz lifecycle ─────────────────────────────────────
  void startQuiz({String? category, int count = 10}) {
    _selectedCategory = category;
    _questions = QuestionBank.getRandomQuiz(count: count, category: category);
    _state = QuizState(
      selectedAnswers: List.filled(_questions.length, null),
    );
    notifyListeners();
  }

  void selectAnswer(int answerIndex) {
    if (currentAnswer != null) return; // Already answered

    final newAnswers = List<int?>.from(_state.selectedAnswers);
    newAnswers[_state.currentIndex] = answerIndex;

    final isCorrect = currentQuestion.isCorrect(answerIndex);

    _state = _state.copyWith(
      selectedAnswers: newAnswers,
      score: isCorrect ? _state.score + 1 : _state.score,
    );
    notifyListeners();
  }

  void nextQuestion() {
    if (isLastQuestion) {
      _state = _state.copyWith(isComplete: true);
      _totalQuizzesPlayed++;
      if (_state.score > _highScore) {
        _highScore = _state.score;
      }
      _saveStats();
    } else {
      _state = _state.copyWith(
        currentIndex: _state.currentIndex + 1,
      );
    }
    notifyListeners();
  }

  void resetQuiz() {
    _questions = [];
    _state = const QuizState();
    _selectedCategory = null;
    notifyListeners();
  }
}
