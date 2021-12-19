// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/features/books_shelf/units/books_list.dart';

void main() {

  group('Scroll Test', () {

    testWidgets('Should not scroll with less items', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(home:  Scaffold(body: BooksList(books: List.generate(5, (index) => 'Book ')))),
      );

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text('Book 0');
      expect(firstBookFinder, findsOneWidget);

    });

    testWidgets('Should scroll with more items', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(home:  Scaffold(body: BooksList(books: List.generate(300, (index) => 'Book ')))),
      );

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text('Book 0');
      expect(firstBookFinder, findsNothing);

      final elevenBookFinder = find.text('Book 11');
      expect(elevenBookFinder, findsOneWidget);

    });

    testWidgets('Should show only 3 on small screen size', (WidgetTester tester) async {

      tester.binding.window.physicalSizeTestValue = const Size(320, 350);

      await tester.pumpWidget(
        MaterialApp(home:  Scaffold(body: BooksList(books: List.generate(300, (index) => 'Book ')))),
      );

      expect(find.byType(ListTile), findsNWidgets(3));

    });

    testWidgets('Should not throw error if books are empty', (WidgetTester tester) async {

      tester.binding.window.physicalSizeTestValue = const Size(320, 350);

      await tester.pumpWidget(
          const MaterialApp(home:  Scaffold(body: BooksList(books: []),
          )));

      expect(tester.takeException(), null);

    });

  });
}