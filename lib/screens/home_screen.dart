import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/question_bank.dart';
import '../utils/app_theme.dart';
import '../utils/quiz_provider.dart';
import '../widgets/category_card.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final categories = QuestionBank.categories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── Header ───────────────────────────────────
              Text(
                'KnowItAll',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [AppTheme.primary, AppTheme.secondary],
                    ).createShader(const Rect.fromLTWH(0, 0, 250, 40)),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Test your general knowledge',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 28),

              // ── Stats row ────────────────────────────────
              Row(
                children: [
                  _StatChip(
                    icon: Icons.emoji_events_rounded,
                    label: 'Best',
                    value: '${provider.highScore}',
                    color: AppTheme.gold,
                  ),
                  const SizedBox(width: 12),
                  _StatChip(
                    icon: Icons.play_circle_rounded,
                    label: 'Played',
                    value: '${provider.totalQuizzesPlayed}',
                    color: AppTheme.secondary,
                  ),
                  const SizedBox(width: 12),
                  _StatChip(
                    icon: Icons.quiz_rounded,
                    label: 'Questions',
                    value: '${QuestionBank.allQuestions.length}',
                    color: AppTheme.accent,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // ── Quick play button ────────────────────────
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    provider.startQuiz();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuizScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bolt_rounded, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Quick Play – 10 Random Questions',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ── Categories ───────────────────────────────
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.35,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final count = QuestionBank.getByCategory(cat).length;
                  return CategoryCard(
                    category: cat,
                    questionCount: count,
                    onTap: () {
                      provider.startQuiz(category: cat, count: count);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QuizScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
