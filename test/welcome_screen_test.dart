import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/welcome_screen.dart';

void main() {
  testWidgets('Welcome screen shows title and CTA',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: WelcomeScreen()),
    );

    expect(find.text('CareConnect'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
