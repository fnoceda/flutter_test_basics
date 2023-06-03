import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets('DropDownView', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.DROPDOWN));

    expect(find.text('select one option'), findsOneWidget);
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('item-yes')), findsOneWidget);
    expect(find.byKey(const Key('item-no')), findsOneWidget);
    await tester.tap(find.text('yes'));
    await tester.pumpAndSettle();
    expect(find.text('yes'), findsOneWidget);
  });
}
