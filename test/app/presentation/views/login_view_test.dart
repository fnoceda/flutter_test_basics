import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';
import 'package:initial/app/presentation/utils/validator.dart';

main() {
  group('LoginView >', () {
    testWidgets('Invalid Fields', (WidgetTester tester) async {
      await _initView(tester);
      expect(find.text('Invalid email'), findsNothing);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Invalid email'), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('input-email')), 'test@test.com');

      await tester.pump();
      expect(find.text('Invalid email'), findsNothing);

      await tester.enterText(
          find.byKey(const ValueKey('input-password')), 'Test123@');
      await tester.pump();
      expect(find.text(PasswordErrors.atLeast1Number), findsNothing);
      expect(find.text(PasswordErrors.atLeast1UpperCase), findsNothing);
      expect(find.text(PasswordErrors.atLeast6Characters), findsNothing);
      expect(find.text(PasswordErrors.whiteSpaces), findsNothing);
    });

    testWidgets('Invalid Credentials', (WidgetTester tester) async {
      await _initView(tester);

      await tester.enterText(
          find.byKey(const ValueKey('input-email')), 'test@test.com');

      await tester.enterText(
          find.byKey(const ValueKey('input-password')), 'Test123@123');
      await tester.pump();

      await tester.tap(find.byType(ElevatedButton));

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // la siguiente linea espera a que termine la animacion
      // await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsNothing);
    });

    testWidgets('success', (WidgetTester tester) async {
      await _initView(tester);

      await tester.enterText(
          find.byKey(const ValueKey('input-email')), 'test@test.com');

      await tester.enterText(
          find.byKey(const ValueKey('input-password')), 'Test123@');
      await tester.pump();

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(find.text('Invalid email or password'), findsNothing);

      expect(find.text('home page'), findsOneWidget);
    });
  });
}

Future<void> _initView(WidgetTester tester) {
  return tester.pumpWidget(const MyApp(
    initialRoute: Routes.LOGIN,
  ));
}
