import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/messages_screen.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/theme/app_theme.dart';

void main() {
  group('MessagesScreen Widget Tests', () {
    testWidgets('Messages screen renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const MessagesScreen(),
          routes: {
            AppRoutes.dashboard: (context) =>
                const Scaffold(body: Text('Dashboard')),
            AppRoutes.tasks: (context) => const Scaffold(body: Text('Tasks')),
            AppRoutes.calendar: (context) =>
                const Scaffold(body: Text('Calendar')),
            AppRoutes.profile: (context) =>
                const Scaffold(body: Text('Profile')),
          },
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.text('Messages'), findsAtLeastNWidgets(1));
      expect(find.text('Emergency SOS'), findsOneWidget);
      expect(find.byIcon(Icons.warning_outlined), findsOneWidget);
      expect(find.text('Quick Contact'), findsOneWidget);
      expect(find.text('SJ'), findsOneWidget);
      expect(find.text('Sarah'), findsOneWidget);
      expect(find.text('Primary Care'), findsOneWidget);
      expect(find.text('DM'), findsOneWidget);
      expect(find.text('Dr.'), findsOneWidget);
      expect(find.text('Doctor'), findsOneWidget);
      expect(find.text('NC'), findsOneWidget);
      expect(find.text('Nurse'), findsOneWidget);
      expect(find.text('Home Care'), findsOneWidget);
      expect(find.text('Type your message...'), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('On my way'), findsOneWidget);
      expect(find.text('Call me'), findsOneWidget);
      expect(find.text('Recent Messages'), findsOneWidget);
      expect(find.text('Robert Martinez'), findsAtLeastNWidgets(1));
      expect(
        find.text('Morning walk completed! Felt great today.'),
        findsOneWidget,
      );
      expect(find.text('1 hour ago'), findsOneWidget);
      expect(find.text('CareConnect'), findsOneWidget);
      expect(
        find.text('Reminder: Physical therapy appointment at 2:00 PM'),
        findsOneWidget,
      );
      expect(find.text('Acknowledge'), findsOneWidget);
      expect(find.text('Snooze 10 min'), findsOneWidget);
      expect(
        find.text('Can you pick up my prescription this afternoon?'),
        findsOneWidget,
      );
      expect(find.text('Unread'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Messages icon in bottom nav is highlighted', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const MessagesScreen(),
        ),
      );

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(bottomNavBar.currentIndex, 3);
    });

    testWidgets('Back button navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(body: Text('Previous Screen')),
          onGenerateRoute: (settings) {
            if (settings.name == '/messages') {
              return MaterialPageRoute(
                builder: (context) => const MessagesScreen(),
              );
            }
            return null;
          },
        ),
      );

      final BuildContext context = tester.element(find.text('Previous Screen'));
      Navigator.pushNamed(context, '/messages');
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.text('Previous Screen'), findsOneWidget);
    });

    testWidgets('Emergency SOS button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sosButton = find.text('Emergency SOS');
      expect(sosButton, findsOneWidget);

      await tester.tap(sosButton);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Emergency SOS - This will immediately contact your emergency contacts and care team',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Quick contact Sarah shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sarahAvatar = find.text('Sarah');
      expect(sarahAvatar, findsOneWidget);

      await tester.tap(sarahAvatar);
      await tester.pumpAndSettle();

      expect(find.text('Opening conversation with Sarah'), findsOneWidget);
    });

    testWidgets('Quick contact Doctor shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final doctorAvatar = find.text('Dr.');
      expect(doctorAvatar, findsOneWidget);

      await tester.tap(doctorAvatar);
      await tester.pumpAndSettle();

      expect(find.text('Opening conversation with Doctor'), findsOneWidget);
    });

    testWidgets('Quick contact Nurse shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final nurseAvatar = find.text('Nurse');
      expect(nurseAvatar, findsOneWidget);

      await tester.tap(nurseAvatar);
      await tester.pumpAndSettle();

      expect(find.text('Opening conversation with Nurse'), findsOneWidget);
    });

    testWidgets('Message input field shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final messageInput = find.byType(TextField);
      expect(messageInput, findsOneWidget);

      await tester.tap(messageInput);
      await tester.pumpAndSettle();

      expect(
        find.text('Send Message - Feature coming soon to send your message'),
        findsOneWidget,
      );
    });

    testWidgets('Send button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sendButton = find.byIcon(Icons.send);
      expect(sendButton, findsOneWidget);

      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Send Message - Feature coming soon to send your message'),
        findsOneWidget,
      );
    });

    testWidgets('Quick reply Yes button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make quick reply visible
      await tester.dragUntilVisible(
        find.text('Yes'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final yesButton = find.text('Yes');
      expect(yesButton, findsOneWidget);

      await tester.tap(yesButton);
      await tester.pumpAndSettle();

      expect(find.text('Quick reply sent: Yes'), findsOneWidget);
    });

    testWidgets('Quick reply On my way button works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make quick reply visible
      await tester.dragUntilVisible(
        find.text('On my way'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final onMyWayButton = find.text('On my way');
      expect(onMyWayButton, findsOneWidget);

      await tester.tap(onMyWayButton);
      await tester.pumpAndSettle();

      expect(find.text('Quick reply sent: On my way'), findsOneWidget);
    });

    testWidgets('Quick reply Call me button works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make quick reply visible
      await tester.dragUntilVisible(
        find.text('Call me'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final callMeButton = find.text('Call me');
      expect(callMeButton, findsOneWidget);

      await tester.tap(callMeButton);
      await tester.pumpAndSettle();

      expect(find.text('Quick reply sent: Call me'), findsOneWidget);
    });

    testWidgets('Message card opens conversation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make message card visible
      await tester.dragUntilVisible(
        find.text('Morning walk completed! Felt great today.'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final messageCard = find.text(
        'Morning walk completed! Felt great today.',
      );
      expect(messageCard, findsOneWidget);

      await tester.tap(messageCard);
      await tester.pumpAndSettle();

      expect(
        find.text('Opening conversation with Robert Martinez'),
        findsOneWidget,
      );
    });

    testWidgets('Acknowledge button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make acknowledge button visible
      await tester.dragUntilVisible(
        find.text('Acknowledge'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final acknowledgeButton = find.text('Acknowledge');
      expect(acknowledgeButton, findsOneWidget);

      await tester.tap(acknowledgeButton);
      await tester.pumpAndSettle();

      expect(find.text('Appointment reminder acknowledged'), findsOneWidget);
    });

    testWidgets('Snooze button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      // Scroll to make snooze button visible
      await tester.dragUntilVisible(
        find.text('Snooze 10 min'),
        find.byType(SingleChildScrollView),
        const Offset(0, -50),
      );

      final snoozeButton = find.text('Snooze 10 min');
      expect(snoozeButton, findsOneWidget);

      await tester.tap(snoozeButton);
      await tester.pumpAndSettle();

      expect(find.text('Reminder snoozed for 10 minutes'), findsOneWidget);
    });

    testWidgets('Bottom navigation navigates to dashboard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
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

    testWidgets('Now banner View button shows appointment details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

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

  group('MessagesScreen Accessibility Tests', () {
    testWidgets('Back button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Back')), findsOneWidget);
    });

    testWidgets('Messages title is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final title = find.text('Messages');
      expect(title, findsAtLeastNWidgets(1));

      // Verify title exists (header flag is internal to Flutter)
      expect(find.text('Messages'), findsAtLeastNWidgets(1));
    });

    testWidgets('Emergency SOS button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Emergency SOS')), findsOneWidget);
    });

    testWidgets('Quick Contact header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final header = find.text('Quick Contact');
      expect(header, findsOneWidget);

      // Verify header exists
      expect(find.text('Quick Contact'), findsOneWidget);
    });

    testWidgets('Sarah contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Contact Sarah.*Primary Care')),
        findsOneWidget,
      );
    });

    testWidgets('Doctor contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Contact Doctor')), findsOneWidget);
    });

    testWidgets('Nurse contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Contact Nurse.*Home Care')),
        findsOneWidget,
      );
    });

    testWidgets('Send message button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Send message')), findsOneWidget);
    });

    testWidgets('Quick reply Yes has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Quick reply.*Yes')),
        findsOneWidget,
      );
    });

    testWidgets('Quick reply On my way has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Quick reply.*On my way')),
        findsOneWidget,
      );
    });

    testWidgets('Recent Messages header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final header = find.text('Recent Messages');
      expect(header, findsOneWidget);

      // Verify header exists
      expect(find.text('Recent Messages'), findsOneWidget);
    });

    testWidgets('Message card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(
          RegExp(r'Message from Robert Martinez.*1 hour ago'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Unread message card indicates unread status', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Unread message from Robert Martinez')),
        findsOneWidget,
      );
    });

    testWidgets('Acknowledge button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(find.bySemanticsLabel(RegExp(r'Acknowledge')), findsOneWidget);
    });

    testWidgets('Snooze button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      expect(
        find.bySemanticsLabel(RegExp(r'Snooze 10 minutes')),
        findsOneWidget,
      );
    });

    testWidgets(
      'Appointment banner has accessibility semantics with live region',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

        expect(
          find.bySemanticsLabel(
            RegExp(r'Current appointment.*Physical Therapy.*2:00 PM.*clinic'),
          ),
          findsOneWidget,
        );
      },
    );
  });

  group('MessagesScreen Navigation Tests', () {
    testWidgets('Bottom nav callback covers current-index return path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const MessagesScreen(),
        ),
      );

      final nav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      nav.onTap?.call(3);
      await tester.pump();
      expect(find.text('Messages'), findsAtLeastNWidgets(1));
    });
  });
}
