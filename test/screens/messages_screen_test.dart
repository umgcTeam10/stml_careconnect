import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
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
      await tester.pump();

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
      await tester.pump();

      expect(find.text('Opening conversation with Sarah'), findsOneWidget);
    });

    testWidgets('Quick contact Doctor shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final doctorAvatar = find.text('Dr.');
      expect(doctorAvatar, findsOneWidget);

      await tester.tap(doctorAvatar);
      await tester.pump();

      expect(find.text('Opening conversation with Doctor'), findsOneWidget);
    });

    testWidgets('Quick contact Nurse shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final nurseAvatar = find.text('Nurse');
      expect(nurseAvatar, findsOneWidget);

      await tester.tap(nurseAvatar);
      await tester.pump();

      expect(find.text('Opening conversation with Nurse'), findsOneWidget);
    });

    testWidgets('Message input field shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final messageInput = find.byType(TextField);
      expect(messageInput, findsOneWidget);

      await tester.tap(messageInput);
      await tester.pump();

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
      await tester.pump();

      expect(
        find.text('Send Message - Feature coming soon to send your message'),
        findsOneWidget,
      );
    });

    testWidgets('Quick reply Yes button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final yesButton = find.text('Yes');
      expect(yesButton, findsOneWidget);

      await tester.tap(yesButton);
      await tester.pump();

      expect(find.text('Quick reply sent: Yes'), findsOneWidget);
    });

    testWidgets('Quick reply On my way button works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final onMyWayButton = find.text('On my way');
      expect(onMyWayButton, findsOneWidget);

      await tester.tap(onMyWayButton);
      await tester.pump();

      expect(find.text('Quick reply sent: On my way'), findsOneWidget);
    });

    testWidgets('Quick reply Call me button works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final callMeButton = find.text('Call me');
      expect(callMeButton, findsOneWidget);

      await tester.tap(callMeButton);
      await tester.pump();

      expect(find.text('Quick reply sent: Call me'), findsOneWidget);
    });

    testWidgets('Message card opens conversation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final messageCard = find.text(
        'Morning walk completed! Felt great today.',
      );
      expect(messageCard, findsOneWidget);

      await tester.tap(messageCard);
      await tester.pump();

      expect(
        find.text('Opening conversation with Robert Martinez'),
        findsOneWidget,
      );
    });

    testWidgets('Acknowledge button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final acknowledgeButton = find.text('Acknowledge');
      expect(acknowledgeButton, findsOneWidget);

      await tester.tap(acknowledgeButton);
      await tester.pump();

      expect(find.text('Appointment reminder acknowledged'), findsOneWidget);
    });

    testWidgets('Snooze button works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final snoozeButton = find.text('Snooze 10 min');
      expect(snoozeButton, findsOneWidget);

      await tester.tap(snoozeButton);
      await tester.pump();

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
      await tester.pump();

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

      final backButton = find.byIcon(Icons.arrow_back);
      expect(backButton, findsOneWidget);

      final semantics = tester.getSemantics(backButton);
      expect(semantics.label, contains('Back'));
      expect(semantics.hint, contains('Navigate back to previous screen'));
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Messages title is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final title = find.text('Messages');
      expect(title, findsAtLeastNWidgets(1));

      final semantics = tester.getSemantics(title.first);
      expect(semantics.hasFlag(SemanticsFlag.isHeader), true);
    });

    testWidgets('Emergency SOS button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sosButton = find.text('Emergency SOS');
      expect(sosButton, findsOneWidget);

      final semantics = tester.getSemantics(sosButton);
      expect(semantics.label, contains('Emergency SOS'));
      expect(
        semantics.hint,
        contains(
          'Double tap to immediately contact your emergency contacts and care team',
        ),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Quick Contact header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final header = find.text('Quick Contact');
      expect(header, findsOneWidget);

      final semantics = tester.getSemantics(header);
      expect(semantics.hasFlag(SemanticsFlag.isHeader), true);
    });

    testWidgets('Sarah contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sarah = find.text('Sarah');
      expect(sarah, findsOneWidget);

      final semantics = tester.getSemantics(sarah);
      expect(semantics.label, contains('Contact Sarah, Primary Care provider'));
      expect(
        semantics.hint,
        contains('Double tap to open conversation with Sarah'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Doctor contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final doctor = find.text('Dr.');
      expect(doctor, findsOneWidget);

      final semantics = tester.getSemantics(doctor);
      expect(semantics.label, contains('Contact Doctor'));
      expect(
        semantics.hint,
        contains('Double tap to open conversation with your doctor'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Nurse contact has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final nurse = find.text('Nurse');
      expect(nurse, findsOneWidget);

      final semantics = tester.getSemantics(nurse);
      expect(semantics.label, contains('Contact Nurse, Home Care provider'));
      expect(
        semantics.hint,
        contains('Double tap to open conversation with your nurse'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Send message button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final sendButton = find.byIcon(Icons.send);
      expect(sendButton, findsOneWidget);

      final semantics = tester.getSemantics(sendButton);
      expect(semantics.label, contains('Send message'));
      expect(semantics.hint, contains('Double tap to send your typed message'));
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Quick reply Yes has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final yesButton = find.text('Yes');
      expect(yesButton, findsOneWidget);

      final semantics = tester.getSemantics(yesButton);
      expect(semantics.label, contains('Quick reply: Yes'));
      expect(
        semantics.hint,
        contains('Double tap to send Yes as a quick reply'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Quick reply On my way has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final onMyWayButton = find.text('On my way');
      expect(onMyWayButton, findsOneWidget);

      final semantics = tester.getSemantics(onMyWayButton);
      expect(semantics.label, contains('Quick reply: On my way'));
      expect(
        semantics.hint,
        contains('Double tap to send On my way as a quick reply'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Recent Messages header is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final header = find.text('Recent Messages');
      expect(header, findsOneWidget);

      final semantics = tester.getSemantics(header);
      expect(semantics.hasFlag(SemanticsFlag.isHeader), true);
    });

    testWidgets('Message card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final messageCard = find.text(
        'Morning walk completed! Felt great today.',
      );
      expect(messageCard, findsOneWidget);

      final semantics = tester.getSemantics(messageCard);
      expect(semantics.label, contains('Message from Robert Martinez'));
      expect(semantics.label, contains('1 hour ago'));
      expect(
        semantics.label,
        contains('Morning walk completed! Felt great today.'),
      );
      expect(
        semantics.hint,
        contains('Double tap to open conversation with Robert Martinez'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Unread message card indicates unread status', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final unreadCard = find.text(
        'Can you pick up my prescription this afternoon?',
      );
      expect(unreadCard, findsOneWidget);

      final semantics = tester.getSemantics(unreadCard);
      expect(semantics.label, contains('Unread message from Robert Martinez'));
      expect(
        semantics.hint,
        contains(
          'Double tap to open conversation and respond to Robert Martinez',
        ),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Acknowledge button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final acknowledgeButton = find.text('Acknowledge');
      expect(acknowledgeButton, findsOneWidget);

      final semantics = tester.getSemantics(acknowledgeButton);
      expect(semantics.label, contains('Acknowledge'));
      expect(
        semantics.hint,
        contains('Double tap to acknowledge this appointment reminder'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Snooze button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

      final snoozeButton = find.text('Snooze 10 min');
      expect(snoozeButton, findsOneWidget);

      final semantics = tester.getSemantics(snoozeButton);
      expect(semantics.label, contains('Snooze 10 minutes'));
      expect(
        semantics.hint,
        contains('Double tap to snooze this reminder for 10 minutes'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets(
      'Appointment banner has accessibility semantics with live region',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: const MessagesScreen()));

        final banner = find.text('Now: Physical Therapy Appointment');
        expect(banner, findsOneWidget);

        final semantics = tester.getSemantics(banner);
        expect(
          semantics.label,
          contains(
            'Current appointment: Physical Therapy at 2:00 PM at clinic',
          ),
        );
        expect(
          semantics.hint,
          contains('Double tap to view full appointment details'),
        );
        expect(semantics.hasEnabledState, true);
        expect(semantics.hasFlag(SemanticsFlag.isLiveRegion), true);
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

extension on SemanticsNode {
  get hasEnabledState => null;
}
