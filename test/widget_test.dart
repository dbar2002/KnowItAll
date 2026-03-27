// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:know_it_all/main.dart';

void main() {
  testWidgets('App launches and shows home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());
    await tester.pumpAndSettle();

    // Verify the app title is displayed
    expect(find.text('KnowItAll'), findsOneWidget);

    // Verify the quick play button exists
    expect(find.textContaining('Quick Play'), findsOneWidget);

    // Verify categories heading is shown
    expect(find.text('Categories'), findsOneWidget);
  });

  testWidgets('Tapping Quick Play navigates to quiz screen', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());
    await tester.pumpAndSettle();

    // Tap Quick Play
    await tester.tap(find.textContaining('Quick Play'));
    await tester.pumpAndSettle();

    // Should see a question counter like "1/10"
    expect(find.text('1/10'), findsOneWidget);
  });
}