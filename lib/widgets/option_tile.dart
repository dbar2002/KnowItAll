import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_theme.dart';

class OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final bool isRevealed;
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    this.isSelected = false,
    this.isCorrect = false,
    this.isWrong = false,
    this.isRevealed = false,
    this.onTap,
  });

  Color get _borderColor {
    if (isCorrect) return AppTheme.correct;
    if (isWrong) return AppTheme.incorrect;
    if (isSelected) return AppTheme.primary;
    return AppTheme.surfaceLight;
  }

  Color get _bgColor {
    if (isCorrect) return AppTheme.correct.withOpacity(0.1);
    if (isWrong) return AppTheme.incorrect.withOpacity(0.1);
    return AppTheme.surfaceLight;
  }

  IconData? get _trailingIcon {
    if (isCorrect) return Icons.check_circle_rounded;
    if (isWrong) return Icons.cancel_rounded;
    return null;
  }

  Color get _trailingColor {
    if (isCorrect) return AppTheme.correct;
    if (isWrong) return AppTheme.incorrect;
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            // Label bubble
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected || isCorrect
                    ? _borderColor.withOpacity(0.2)
                    : AppTheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected || isCorrect
                      ? _borderColor
                      : AppTheme.textSecondary,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Option text
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),

            // Result icon
            if (_trailingIcon != null)
              Icon(_trailingIcon, color: _trailingColor, size: 22),
          ],
        ),
      ),
    );
  }
}
