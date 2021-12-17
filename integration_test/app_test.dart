import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/home_view.dart';
import 'package:testing_in_flutter/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Test Login', () {

    testWidgets('On Login Success', (tester) async {

      app.main();
      await tester.pumpAndSettle();

      final emailFinder = find.byType(TextFormField).first;
      final passwordFinder = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton);

      await tester.enterText(emailFinder, 'a@a.com');
      await tester.pumpAndSettle();

      await tester.enterText(passwordFinder, '12345678');
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));

      expect(find.byType(HomeView), findsOneWidget);

    });

    testWidgets('On Login Error', (tester) async {

      app.main();
      await tester.pumpAndSettle();

      final emailFinder = find.byType(TextFormField).first;
      final passwordFinder = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton);

      await tester.enterText(emailFinder, 'aaaaaaaaaaa@a.com');
      await tester.pumpAndSettle();

      await tester.enterText(passwordFinder, '12345678');
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 4));

      final dialogButton = find.byType(CupertinoButton);
      await tester.tap(dialogButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));

      expect(find.byType(HomeView), findsNothing);

    });


  });

}

// void main() {
//
//   group('App Test', () {
//     IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//
//     testWidgets("full app test", (tester) async {
//
//       app.main();
//       await tester.pumpAndSettle();
//
//       var emailField = find.byType(TextFormField).first;
//       var passwordField = find.byType(TextFormField).last;
//       var loginButton = find.byType(ElevatedButton).first;
//
//       await tester.enterText(emailField, 'a@a.com');
//       await tester.pumpAndSettle();
//
//       await tester.enterText(passwordField, '12345678');
//       await tester.pumpAndSettle();
//
//       await tester.tap(loginButton);
//       await tester.pumpAndSettle();
//
//       await Future.delayed(const Duration(seconds: 3));
//
//       expect(find.byType(HomeView), findsOneWidget);
//
//     });
//   });
// }