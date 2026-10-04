import 'package:flutter_test/flutter_test.dart';
import 'package:indoor_navigation_system/main.dart';

void main() {
  testWidgets('guest can log in without credentials', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Continue as Guest'), findsOneWidget);

    await tester.tap(find.text('Continue as Guest'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome, Guest!'), findsOneWidget);
  });
}
