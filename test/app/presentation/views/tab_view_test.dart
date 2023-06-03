import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets('TabViewTest >', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.TABS));
    expect(find.text('content 1'), findsOneWidget);

    final element = find.byType(Tab).evaluate();

    for (int i = 0; i < element.length; i++) {
      await tester.tap(find.byType(Tab).at(i));
      await tester.pumpAndSettle();
      expect(find.text('content ${i + 1}'), findsOneWidget);
    }

    final width = tester.getSize(find.byType(Scaffold)).width;
    await tester.dragFrom(
      const Offset(30, 200),
      Offset(width, 200),
    );
    await tester.pumpAndSettle();
    expect(find.text('content 2'), findsOneWidget);
  });
}
