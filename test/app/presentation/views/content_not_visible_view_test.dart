import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets('ContentNotVisible > ListView', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MyApp(initialRoute: Routes.CONTENT_NOT_VISIBLE));

    final textFinder = find.text('show message');

    // scroll hasta el final
    await tester.dragFrom(const Offset(100, 100), const Offset(100, -10000));
    await tester.pumpAndSettle(); // espera a terminar la anuimacion

    expect(textFinder, findsOneWidget);

    await tester.tap(textFinder);
    await tester.pump();
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  // testWidgets('ContentNotVisible > SingleChildScrollView', (WidgetTester tester) async {
  //   await tester
  //       .pumpWidget(const MyApp(initialRoute: Routes.CONTENT_NOT_VISIBLE));

  //   final textFinder = find.text('show message');

  //   expect(textFinder, findsOneWidget);
  //   await tester.ensureVisible(textFinder);
  //   await tester.tap(textFinder);
  //   await tester.pump();
  //   expect(find.byType(AlertDialog), findsOneWidget);
  // });
}
