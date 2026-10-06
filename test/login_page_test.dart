import 'package:flutter_test/flutter_test.dart';
import 'package:indoor_navigation_system/main.dart';

void main() {
  testWidgets('guest goes through setup without credentials', (tester) async {
    await tester.pumpWidget(const MainApp());

    await tester.tap(find.text('Continue as Guest'));
    await tester.pumpAndSettle();

    // Step 1: choose a place.
    expect(find.text('Where will the app be used?'), findsOneWidget);
    await tester.tap(find.text('Hospital'));
    await tester.pump();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 2: coverage area.
    expect(find.text('Coverage area'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 3: summary.
    expect(find.text('Review your setup'), findsOneWidget);
    expect(find.text('Hospital'), findsOneWidget);
    await tester.tap(find.text('Finish setup'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Welcome, Guest!'), findsOneWidget);
  });
}
