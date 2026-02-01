import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/profile_screen.dart';
import 'package:stml_careconnect/theme/app_theme.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    testWidgets('Profile screen renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const ProfileScreen(),
          routes: {
            AppRoutes.dashboard: (context) =>
                const Scaffold(body: Text('Dashboard')),
            AppRoutes.tasks: (context) => const Scaffold(body: Text('Tasks')),
            AppRoutes.calendar: (context) =>
                const Scaffold(body: Text('Calendar')),
            AppRoutes.messages: (context) =>
                const Scaffold(body: Text('Messages')),
            AppRoutes.healthLogs: (context) =>
                const Scaffold(body: Text('Health Logs')),
          },
        ),
      );

      // Verify header (Profile appears in both header and bottom nav)
      expect(find.text('Profile'), findsAtLeastNWidgets(1));
      expect(find.text('Settings'), findsOneWidget);

      // Verify user profile section
      expect(find.text('SJ'), findsOneWidget);
      expect(find.text('Sarah Johnson'), findsOneWidget);
      expect(find.text('Caregiver'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);

      // Verify contact information
      expect(find.text('sarah.johnson@email.com'), findsOneWidget);
      expect(find.text('(555) 123-4567'), findsOneWidget);

      // Verify Notifications section
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Manage your notification settings'), findsOneWidget);
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('Task Reminders'), findsOneWidget);

      // Verify Preferences section
      expect(find.text('Preferences'), findsOneWidget);
      expect(
        find.text('Customize your CareConnect experience'),
        findsOneWidget,
      );
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.text('Disabled'), findsOneWidget);

      // Verify Accessibility section
      expect(find.text('Accessibility'), findsOneWidget);
      expect(find.text('Adjust settings for better usability'), findsOneWidget);
      expect(find.text('Text Size'), findsOneWidget);
      expect(find.text('High Contrast'), findsOneWidget);

      // Verify other settings
      expect(find.text('Privacy & Security'), findsOneWidget);
      expect(find.text('Help & Support'), findsOneWidget);
      expect(find.text('Sign Out'), findsOneWidget);

      // Verify bottom navigation
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
      // Profile appears in header and bottom nav
      expect(find.text('Profile'), findsAtLeastNWidgets(1));
    });

    testWidgets('Profile icon in bottom nav is highlighted', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const ProfileScreen(),
        ),
      );

      // The Profile icon should be selected (index 4)
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(bottomNavBar.currentIndex, 4);
    });

    testWidgets('Settings button shows not implemented message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Find and tap the Settings button
      final settingsButton = find.text('Settings');
      expect(settingsButton, findsOneWidget);

      await tester.tap(settingsButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Edit button shows not implemented message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Find and tap the Edit button
      final editButton = find.text('Edit');
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Toggle switches can be interacted with', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Find all switches
      final switches = find.byType(Switch);
      expect(
        switches,
        findsNWidgets(4),
      ); // 3 notification toggles + 1 dark mode toggle

      // Tap the first switch (Push Notifications)
      await tester.tap(switches.first);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Text Size option is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to find Text Size option
      await tester.scrollUntilVisible(
        find.text('Text Size'),
        100,
        scrollable: find.byType(Scrollable),
      );

      // Find and tap Text Size
      final textSizeOption = find.text('Text Size');
      expect(textSizeOption, findsOneWidget);

      await tester.tap(textSizeOption);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('High Contrast option is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to find High Contrast option
      await tester.scrollUntilVisible(
        find.text('High Contrast'),
        100,
        scrollable: find.byType(Scrollable),
      );

      // Find and tap High Contrast
      final highContrastOption = find.text('High Contrast');
      expect(highContrastOption, findsOneWidget);

      await tester.tap(highContrastOption);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Privacy & Security option is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to find Privacy & Security option
      await tester.scrollUntilVisible(
        find.text('Privacy & Security'),
        100,
        scrollable: find.byType(Scrollable),
      );

      // Find and tap Privacy & Security
      final privacyOption = find.text('Privacy & Security');
      expect(privacyOption, findsOneWidget);

      await tester.tap(privacyOption);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Help & Support option is tappable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to find Help & Support option
      await tester.scrollUntilVisible(
        find.text('Help & Support'),
        100,
        scrollable: find.byType(Scrollable),
      );

      // Find and tap Help & Support
      final helpOption = find.text('Help & Support');
      expect(helpOption, findsOneWidget);

      await tester.tap(helpOption);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Sign Out button is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to find Sign Out button
      await tester.scrollUntilVisible(
        find.text('Sign Out'),
        100,
        scrollable: find.byType(Scrollable),
      );

      // Find and tap Sign Out
      final signOutButton = find.text('Sign Out');
      expect(signOutButton, findsOneWidget);

      await tester.tap(signOutButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Bottom navigation navigates to dashboard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ProfileScreen(),
          routes: {
            AppRoutes.dashboard: (context) =>
                const Scaffold(body: Text('Dashboard Screen')),
          },
        ),
      );

      // Tap Home icon
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Dashboard Screen'), findsOneWidget);
    });
  });
}
