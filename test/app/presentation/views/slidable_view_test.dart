import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/my_app.dart';
import 'package:initial/app/presentation/routes/routes.dart';

void main() {
  testWidgets('SlidableView > slide middle', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.SLIDABLE));

    final width = tester.getSize(find.byType(Scaffold)).width;
    // print(width);
    final center = tester.getCenter(find.byType(Slidable).first);
    // print(center);

    final slidable = tester.widget<Slidable>(find.byType(Slidable).first);
    print(slidable.key);

    expect(find.byKey(slidable.key!), findsOneWidget);

    await tester.dragFrom(
      Offset(width - 10, center.dy),
      Offset(-center.dx, center.dy),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SlidableAction), findsOneWidget);

    await tester.tap(find.byType(SlidableAction));
    await tester.pumpAndSettle();
    expect(find.byType(SlidableAction), findsNothing);
  });

  testWidgets('SlidableView > slide all', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.SLIDABLE));

    final width = tester.getSize(find.byType(Scaffold)).width;
    // print(width);
    final center = tester.getCenter(find.byType(Slidable).first);
    // print(center);

    final slidable = tester.widget<Slidable>(find.byType(Slidable).first);
    print(slidable.key);

    expect(find.byKey(slidable.key!), findsOneWidget);

    await tester.timedDragFrom(
      Offset(width - 10, center.dy),
      Offset(-width, center.dy),
      const Duration(milliseconds: 400),
    );

    await tester.pumpAndSettle();
    expect(find.byType(SlidableAction), findsNothing);
  });
}
