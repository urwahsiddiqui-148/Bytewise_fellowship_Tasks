import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:working_with_api_calls/main.dart';

void main() {
  testWidgets('Fetch data button smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our initial text is displayed.
    expect(find.text('Press the button to fetch data'), findsOneWidget);
    expect(find.text('Failed to load data'), findsNothing);

    // Tap the 'Fetch Data' button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Start the frame

    // Since the HTTP call is asynchronous, we need to wait for the response.
    // In a real test, we might use a mock HTTP client, but for simplicity,
    // we'll just allow some time for the response.
    await tester.pumpAndSettle();

    // Verify that our text has changed.
    expect(find.text('Press the button to fetch data'), findsNothing);
  });
}
