import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/presentation/dialogs/show_loader.dart';

void main() {
  //
  testWidgets('Show Loader', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: _Home()));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showLoader(
              context,
              Future.delayed(
                const Duration(milliseconds: 300),
              ));
          print('finish');
        },
      ),
    );
  }
}
