@TestOn('chrome')
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/presentation/views/platform_widgets_view.dart';

// flutter test test/app/presentation/views/platform_widget_view_web_test.dart --platform chrome
// flutter test test/**/*_web_test.dart --platform chrome

main() {
  group('Platform  >', () {
    testWidgets('Web', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PlatformWidgetsView()));
      expect(find.text('web'), findsOneWidget);
    });
  });
}
