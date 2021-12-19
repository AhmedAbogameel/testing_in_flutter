// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing_in_flutter/main.dart';

void main() {
 group('Test Counter Widget', () {

   testWidgets('Should be 1 on tap', (tester) async {

     await tester.pumpWidget(const MyApp());

     expect(find.text('0'), findsOneWidget);
     expect(find.text('1'), findsNothing);

     final buttonFinder = find.byKey(const Key('GD'));

     await tester.tap(buttonFinder);
     await tester.pump();

     expect(find.text('0'), findsNothing);
     expect(find.text('1'), findsOneWidget);
   });

   testWidgets('Should be -1 on long tap', (tester) async {

     await tester.pumpWidget(const MyApp());

     expect(find.text('0'), findsOneWidget);
     expect(find.text('1'), findsNothing);

     final buttonFinder = find.byKey(const Key('GD'));

     await tester.longPress(buttonFinder);
     await tester.pump();

     expect(find.text('0'), findsNothing);
     expect(find.text('-1'), findsOneWidget);
   });

 });
}
