import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stml_careconnect/screens/messages_screen.dart';

void main() {
  testWidgets('MessagesScreen shows emergency button and messages',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MessagesScreen(),
      ),
    );

    // Verify title
    expect(find.text('Messages'), findsOneWidget);

    // Verify Emergency SOS button
    expect(find.text('Emergency SOS'), findsOneWidget);

    // Verify message input
    expect(find.byType(TextField), findsOneWidget);

    // Verify recent message
    expect(find.text('Robert Martinez'), findsOneWidget);

    // Tap emergency button
    await tester.tap(find.text('Emergency SOS'));
    await tester.pump();
  });
}
