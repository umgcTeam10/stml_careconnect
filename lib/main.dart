import 'package:flutter/material.dart';
import 'app/app_routes.dart';
import 'screens/calendar_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/task_details_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CareConnectApp());
}

class CareConnectApp extends StatelessWidget {
  const CareConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareConnect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (context) => const WelcomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignUpScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.tasks: (context) => const TasksScreen(),
        AppRoutes.taskDetails: (context) => const TaskDetailsScreen(),
        AppRoutes.calendar: (context) => const CalendarScreen(),
        AppRoutes.messages: (context) => const MessagesScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.notifications: (context) => const NotificationsScreen(),
      },
    );
  }
}
