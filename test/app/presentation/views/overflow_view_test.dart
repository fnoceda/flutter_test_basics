import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Overflow Test', (WidgetTester tester) async {
    // tester.binding.window.physicalSizeTestValue = const Size(2400 * 2, 1800 * 2);
    tester.view.physicalSize = const Size(300, 400);

    await tester.pumpWidget(const MyApp(initialRoute: Routes.OVERFLOW));
    print(tester.view.physicalSize);

    // tester.binding.window.clearPhysicalSizeTestValue();
    addTearDown(tester.view.resetPhysicalSize);
  });
}
