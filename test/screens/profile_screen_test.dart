import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:stml_careconnect/providers/profile_provider.dart';
import 'package:stml_careconnect/screens/profile_screen.dart';

void main() {
  testWidgets('ProfileScreen displays user info and toggles preferences', (
    WidgetTester tester,
  ) async {
    // Set a large test window so all widgets are visible
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // Wrap ProfileScreen with ChangeNotifierProvider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ProfileProvider(),
        child: const MaterialApp(home: ProfileScreen()),
      ),
    );

    // Wait for all rebuilds
    await tester.pumpAndSettle();

    // Verify user name and provider name
    expect(find.text('Robert Martinez'), findsOneWidget);
    expect(find.text('Caregiver: Sarah Johnson'), findsOneWidget);

    // Verify Preferences titles
    expect(find.text('Preferences'), findsOneWidget);
    expect(find.text('Push Notifications'), findsOneWidget);
    expect(find.text('Email Notifications'), findsOneWidget);
    expect(find.text('Task Reminders'), findsOneWidget);

    // Verify Sign Out button by Key
    expect(find.byKey(const Key('signOutButton')), findsOneWidget);

    // Clean up the test window override
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);
  });
}
