# KnowItAll

A sleek general knowledge quiz app built with Flutter.

## Features

- **60+ questions** across 7 categories: Science, History, Geography, Arts & Literature, Sports, Food & Culture, and Technology
- **Quick Play** mode — 10 random questions from all categories
- **Category mode** — focus on a specific topic
- **Instant feedback** — correct/incorrect answers highlighted with explanations for select questions
- **Score tracking** — high score and total games played persisted locally
- **Confetti celebration** when you score 70% or higher
- **Animated transitions** between questions

## Screenshots

*(Add your own screenshots here)*

## Getting Started

### Prerequisites

- Flutter SDK `>=3.1.0`
- Dart `>=3.1.0`

### Installation

1. Clone the repo or copy the `lib/` folder and `pubspec.yaml` into your Flutter project root.

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                  # App entry point
├── data/
│   └── question_bank.dart     # All questions and helper methods
├── models/
│   ├── question.dart          # Question model
│   └── quiz_state.dart        # Quiz state model
├── screens/
│   ├── home_screen.dart       # Home with stats and categories
│   ├── quiz_screen.dart       # Question and answer flow
│   └── result_screen.dart     # Score summary with confetti
├── utils/
│   ├── app_theme.dart         # Colors, fonts, and theme data
│   └── quiz_provider.dart     # State management (Provider)
└── widgets/
    ├── category_card.dart     # Category grid tile
    └── option_tile.dart       # Answer option button
```

## Dependencies

| Package | Purpose |
|---|---|
| `provider` | State management |
| `google_fonts` | Poppins typography |
| `shared_preferences` | Persist high score and stats |
| `confetti` | Celebration effects on results screen |
| `percent_indicator` | Progress bar during quiz |
| `animated_text_kit` | Text animations |

## Adding Questions

Add new questions to `lib/data/question_bank.dart`:

```dart
Question(
  id: 'unique_id',
  question: 'Your question here?',
  options: ['Option A', 'Option B', 'Option C', 'Option D'],
  correctIndex: 0, // index of the correct answer
  category: 'Science', // must match an existing category or add a new one
  difficulty: 'medium', // easy, medium, or hard
  explanation: 'Optional explanation shown after answering.',
),
```

New categories are picked up automatically — just use a new category string and add a color/icon mapping in `app_theme.dart`.

## License

MIT
