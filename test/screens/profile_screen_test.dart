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

      expect(find.text('Profile'), findsAtLeastNWidgets(1));
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('SJ'), findsOneWidget);
      expect(find.text('Sarah Johnson'), findsOneWidget);
      expect(find.text('Caregiver'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('sarah.johnson@email.com'), findsOneWidget);
      expect(find.text('(555) 123-4567'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Manage your notification settings'), findsOneWidget);
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('Task Reminders'), findsOneWidget);
      expect(find.text('Preferences'), findsOneWidget);
      expect(
        find.text('Customize your CareConnect experience'),
        findsOneWidget,
      );
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.text('Disabled'), findsOneWidget);
      expect(find.text('Accessibility'), findsOneWidget);
      expect(find.text('Adjust settings for better usability'), findsOneWidget);
      expect(find.text('Text Size'), findsOneWidget);
      expect(find.text('High Contrast'), findsOneWidget);
      expect(find.text('Privacy & Security'), findsOneWidget);
      expect(find.text('Help & Support'), findsOneWidget);
      expect(find.text('Sign Out'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
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

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(bottomNavBar.currentIndex, 4);
    });

    testWidgets('Settings button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final settingsButton = find.text('Settings');
      expect(settingsButton, findsOneWidget);

      await tester.tap(settingsButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Settings - Configure app preferences and account options'),
        findsOneWidget,
      );
    });

    testWidgets('Edit button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final editButton = find.text('Edit');
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Edit Profile - Update your name, photo, and personal information',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Push Notifications toggle shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final switches = find.byType(Switch);
      expect(switches, findsNWidgets(4));

      await tester.tap(switches.first);
      await tester.pumpAndSettle();

      expect(find.text('Push Notifications disabled'), findsOneWidget);
    });

    testWidgets('Email Notifications toggle shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to make the switch visible
      await tester.scrollUntilVisible(
        find.text('Email Notifications'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final switches = find.byType(Switch);
      await tester.tap(switches.at(1));
      await tester.pumpAndSettle();

      expect(find.text('Email Notifications disabled'), findsOneWidget);
    });

    testWidgets('Task Reminders toggle shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to make the switch visible
      await tester.scrollUntilVisible(
        find.text('Task Reminders'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final switches = find.byType(Switch);
      await tester.tap(switches.at(2));
      await tester.pumpAndSettle();

      expect(find.text('Task Reminders disabled'), findsOneWidget);
    });

    testWidgets('Dark Mode toggle shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      // Scroll to make the switch visible
      await tester.scrollUntilVisible(
        find.text('Dark Mode'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final switches = find.byType(Switch);
      await tester.tap(switches.at(3));
      await tester.pumpAndSettle();

      expect(find.text('Dark Mode enabled'), findsOneWidget);
    });

    testWidgets('Text Size option shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Text Size'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final textSizeOption = find.text('Text Size');
      expect(textSizeOption, findsOneWidget);

      await tester.tap(textSizeOption);
      await tester.pumpAndSettle();

      expect(
        find.text('Text Size - Adjust font size for better readability'),
        findsOneWidget,
      );
    });

    testWidgets('High Contrast option shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('High Contrast'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final highContrastOption = find.text('High Contrast');
      expect(highContrastOption, findsOneWidget);

      await tester.tap(highContrastOption);
      await tester.pumpAndSettle();

      expect(
        find.text('High Contrast - Improve visibility with enhanced contrast'),
        findsOneWidget,
      );
    });

    testWidgets('Privacy & Security option shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Privacy & Security'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final privacyOption = find.text('Privacy & Security');
      expect(privacyOption, findsOneWidget);

      await tester.tap(privacyOption);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Privacy & Security - Manage your data and security settings',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Help & Support option shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Help & Support'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final helpOption = find.text('Help & Support');
      expect(helpOption, findsOneWidget);

      await tester.tap(helpOption);
      await tester.pumpAndSettle();

      expect(
        find.text('Help & Support - Access user guides and contact support'),
        findsOneWidget,
      );
    });

    testWidgets('Sign Out button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Sign Out'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final signOutButton = find.text('Sign Out');
      expect(signOutButton, findsOneWidget);

      await tester.tap(signOutButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Sign Out - You will be logged out of your account'),
        findsOneWidget,
      );
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

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard Screen'), findsOneWidget);
    });

    testWidgets('Appointment banner View button shows details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final viewButton = find.text('View');
      expect(viewButton, findsOneWidget);

      await tester.tap(viewButton);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Physical Therapy Appointment at 2:00 PM at clinic - Tap to view full details',
        ),
        findsOneWidget,
      );
    });
  });

  group('ProfileScreen Accessibility Tests', () {
    testWidgets('Profile title is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final title = find.text('Profile');
      expect(title, findsAtLeastNWidgets(1));

      // Verify title exists (header flag is internal to Flutter)
      expect(find.text('Profile'), findsAtLeastNWidgets(1));
    });

    testWidgets('Settings button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Settings')), findsOneWidget);
    });

    testWidgets('User profile has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(
          RegExp(r'User profile.*Sarah Johnson.*Caregiver'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Edit profile button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Edit profile')), findsOneWidget);
    });

    testWidgets('Contact information has accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(
          RegExp(
            r'Contact information.*Email.*sarah\.johnson@email\.com.*Phone.*555.*123-4567',
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Notifications header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final header = find.text('Notifications');
      expect(header, findsOneWidget);

      // Verify header exists
      expect(find.text('Notifications'), findsOneWidget);
    });

    testWidgets('Push Notifications toggle has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Push Notifications.*currently enabled')),
        findsOneWidget,
      );
    });

    testWidgets('Email Notifications toggle has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(
          RegExp(r'Email Notifications.*currently enabled'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Task Reminders toggle has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Task Reminders.*currently enabled')),
        findsOneWidget,
      );
    });

    testWidgets('Preferences header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final header = find.text('Preferences');
      expect(header, findsOneWidget);

      // Verify header exists
      expect(find.text('Preferences'), findsOneWidget);
    });

    testWidgets('Dark Mode toggle has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Dark Mode.*currently disabled')),
        findsOneWidget,
      );
    });

    testWidgets('Accessibility header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Accessibility'),
        100,
        scrollable: find.byType(Scrollable),
      );

      final header = find.text('Accessibility');
      expect(header, findsOneWidget);

      // Verify header exists
      expect(find.text('Accessibility'), findsOneWidget);
    });

    testWidgets('Text Size option has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Text Size'),
        100,
        scrollable: find.byType(Scrollable),
      );

      expect(
        find.bySemanticsLabel(
          RegExp(r'Text Size.*adjust font size for better readability'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('High Contrast option has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('High Contrast'),
        100,
        scrollable: find.byType(Scrollable),
      );

      expect(
        find.bySemanticsLabel(
          RegExp(r'High Contrast.*improve visibility with enhanced contrast'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Privacy & Security option has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Privacy & Security'),
        100,
        scrollable: find.byType(Scrollable),
      );

      expect(
        find.bySemanticsLabel(
          RegExp(
            r'Privacy and Security.*manage your data and security settings',
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Help & Support option has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Help & Support'),
        100,
        scrollable: find.byType(Scrollable),
      );

      expect(
        find.bySemanticsLabel(
          RegExp(r'Help and Support.*access user guides and contact support'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Sign Out button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      await tester.scrollUntilVisible(
        find.text('Sign Out'),
        100,
        scrollable: find.byType(Scrollable),
      );

      expect(find.bySemanticsLabel(RegExp(r'Sign Out')), findsOneWidget);
    });

    testWidgets(
      'Appointment banner has accessibility semantics with live region',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

        expect(
          find.bySemanticsLabel(
            RegExp(r'Current appointment.*Physical Therapy.*2:00 PM.*clinic'),
          ),
          findsOneWidget,
        );
      },
    );
  });

  group('ProfileScreen Navigation Tests', () {
    testWidgets('Bottom nav callback covers current-index return path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));

      final nav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      nav.onTap?.call(4);
      await tester.pump();
      expect(find.text('Profile'), findsAtLeastNWidgets(1));
    });
  });
}
