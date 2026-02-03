import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/notifications_screen.dart';

void main() {
  testWidgets('Notifications screen renders placeholder', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationsScreen()));

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Placeholder (Week 4)'), findsOneWidget);
  });
}
