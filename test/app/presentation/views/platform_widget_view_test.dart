import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

main() {
  group('Platform View >', () {
    testWidgets('Android', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(
          initialRoute: Routes.PLATFORM_WIDGETS,
        ),
      );
      expect(find.text('android'), findsOneWidget);
    });
    //
    testWidgets('iOS', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await tester.pumpWidget(
        const MyApp(
          initialRoute: Routes.PLATFORM_WIDGETS,
        ),
      );
      expect(find.text('ios'), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
