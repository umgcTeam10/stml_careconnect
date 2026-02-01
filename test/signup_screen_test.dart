import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/signup_screen.dart';

void main() {
  testWidgets('Sign up screen shows role choices and CTA', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpScreen(),
      ),
    );

    expect(find.text('Choose Your Role'), findsOneWidget);
    expect(find.text("I'm a Caregiver"), findsOneWidget);
    expect(find.text("I'm a Care Recipient"), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Continue navigates to dashboard', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SignUpScreen(),
        routes: {
          AppRoutes.dashboard: (context) => const Scaffold(
                body: Text('Dashboard Home'),
              ),
        },
      ),
    );

    final continueFinder = find.text('Continue');
    await tester.ensureVisible(continueFinder);
    await tester.tap(continueFinder);
    await tester.pumpAndSettle();

    expect(find.text('Dashboard Home'), findsOneWidget);
  });
}
