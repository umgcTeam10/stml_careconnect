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

  testWidgets('Selecting role updates selection state (smoke)', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));

    // Tap caregiver card (covers lines 76–78)
    final caregiverFinder = find.text("I'm a Caregiver");
    await tester.ensureVisible(caregiverFinder);
    await tester.tap(caregiverFinder);
    await tester.pumpAndSettle();

    // Tap recipient card (covers lines 94–96) — scroll into view first (off-screen in default test bounds)
    final recipientFinder = find.text("I'm a Care Recipient");
    await tester.ensureVisible(recipientFinder);
    await tester.tap(recipientFinder);
    await tester.pumpAndSettle();

    // Tapping again should not crash and keeps UI stable.
    await tester.ensureVisible(recipientFinder);
    await tester.tap(recipientFinder);
    await tester.pump();

    // Basic sanity: bullets should still be visible.
    expect(find.text('View your care plan and tasks'), findsOneWidget);
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
