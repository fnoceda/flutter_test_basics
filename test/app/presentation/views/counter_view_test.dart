import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets(
    'CounterView',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp(
        initialRoute: Routes.COUNTER,
      ));

      final finder = find.byType(FloatingActionButton);

      for (var i = 0; i < 5; i++) {
        expect(find.text('$i'), findsOneWidget);
        await tester.tap(finder.at(0));
        await tester.pump();
        expect(find.text('${i + 1}'), findsWidgets);
      }

      await tester.pumpAndSettle();
      expect(find.byType(FloatingActionButton), findsNothing);
    },
  );

  testWidgets('CounterView > abc', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(
        initialRoute: Routes.COUNTER,
      ),
    );

    await tester.tap(find.byKey(const ValueKey('abc')));
    await tester.pumpAndSettle();
    expect(find.text('abc'), findsWidgets);
  });
}
