import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _lightBlue = Color(0xFFEFF5FF);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _handleSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Settings - Configure app preferences and account options',
        ),
      ),
    );
  }

  void _handleEditProfile(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Edit Profile - Update your name, photo, and personal information',
        ),
      ),
    );
  }

  void _handlePushNotifications(BuildContext context, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Push Notifications ${value ? 'enabled' : 'disabled'}'),
      ),
    );
  }

  void _handleEmailNotifications(BuildContext context, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email Notifications ${value ? 'enabled' : 'disabled'}'),
      ),
    );
  }

  void _handleTaskReminders(BuildContext context, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task Reminders ${value ? 'enabled' : 'disabled'}'),
      ),
    );
  }

  void _handleDarkMode(BuildContext context, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dark Mode ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _handleTextSize(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text Size - Adjust font size for better readability'),
      ),
    );
  }

  void _handleHighContrast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'High Contrast - Improve visibility with enhanced contrast',
        ),
      ),
    );
  }

  void _handlePrivacySecurity(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Privacy & Security - Manage your data and security settings',
        ),
      ),
    );
  }

  void _handleHelpSupport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Help & Support - Access user guides and contact support',
        ),
      ),
    );
  }

  void _handleSignOut(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign Out - You will be logged out of your account'),
      ),
    );
  }

  void _handleViewAppointment(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Physical Therapy Appointment at 2:00 PM at clinic - Tap to view full details',
        ),
      ),
    );
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        return;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.tasks);
        return;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.calendar);
        return;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.messages);
        return;
      case 4:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: _headerColor,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Expanded(
                    child: Semantics(
                      header: true,
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'Settings',
                    hint:
                        'Double tap to configure app preferences and account options',
                    button: true,
                    child: TextButton(
                      onPressed: () => _handleSettings(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: ExcludeSemantics(
                        child: const Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile Overview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    label: 'User profile, Sarah Johnson, Caregiver',
                    child: _ProfileCard(
                      child: Row(
                        children: [
                          ExcludeSemantics(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Center(
                                child: Text(
                                  'SJ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ExcludeSemantics(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sarah Johnson',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Caregiver',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _mutedText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Semantics(
                            label: 'Edit profile',
                            hint:
                                'Double tap to update your name, photo, and personal information',
                            button: true,
                            child: TextButton(
                              onPressed: () => _handleEditProfile(context),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: ExcludeSemantics(
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    label:
                        'Contact information, Email: sarah.johnson@email.com, Phone: (555) 123-4567',
                    child: _ProfileCard(
                      child: ExcludeSemantics(
                        child: Column(
                          children: [
                            _ContactRow(
                              icon: Icons.email_outlined,
                              text: 'sarah.johnson@email.com',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 1, color: _cardBorder),
                            const SizedBox(height: 12),
                            _ContactRow(
                              icon: Icons.phone_outlined,
                              text: '(555) 123-4567',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    header: true,
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ExcludeSemantics(
                    child: const Text(
                      'Manage your notification settings',
                      style: TextStyle(fontSize: 13, color: _mutedText),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: Column(
                      children: [
                        _PreferenceToggle(
                          icon: Icons.notifications_outlined,
                          iconColor: AppColors.primary,
                          iconBackground: _lightBlue,
                          title: 'Push Notifications',
                          subtitle: 'Receive app notifications',
                          value: true,
                          semanticLabel:
                              'Push Notifications, currently enabled',
                          semanticHint:
                              'Double tap to toggle push notifications on or off',
                          onChanged: (value) =>
                              _handlePushNotifications(context, value),
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: _cardBorder),
                        const SizedBox(height: 12),
                        _PreferenceToggle(
                          icon: Icons.email_outlined,
                          iconColor: AppColors.primary,
                          iconBackground: _lightBlue,
                          title: 'Email Notifications',
                          subtitle: 'Receive email updates',
                          value: true,
                          semanticLabel:
                              'Email Notifications, currently enabled',
                          semanticHint:
                              'Double tap to toggle email notifications on or off',
                          onChanged: (value) =>
                              _handleEmailNotifications(context, value),
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: _cardBorder),
                        const SizedBox(height: 12),
                        _PreferenceToggle(
                          icon: Icons.alarm_outlined,
                          iconColor: Color(0xFFEA8C3E),
                          iconBackground: Color(0xFFFFF4E6),
                          title: 'Task Reminders',
                          subtitle: 'Remind me about tasks',
                          value: true,
                          semanticLabel: 'Task Reminders, currently enabled',
                          semanticHint:
                              'Double tap to toggle task reminders on or off',
                          onChanged: (value) =>
                              _handleTaskReminders(context, value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    header: true,
                    child: Text(
                      'Preferences',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ExcludeSemantics(
                    child: const Text(
                      'Customize your CareConnect experience',
                      style: TextStyle(fontSize: 13, color: _mutedText),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: _PreferenceToggle(
                      icon: Icons.dark_mode_outlined,
                      iconColor: _mutedText,
                      iconBackground: _lightBlue,
                      title: 'Dark Mode',
                      subtitle: 'Disabled',
                      value: false,
                      semanticLabel: 'Dark Mode, currently disabled',
                      semanticHint: 'Double tap to toggle dark mode on or off',
                      onChanged: (value) => _handleDarkMode(context, value),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    header: true,
                    child: Text(
                      'Accessibility',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ExcludeSemantics(
                    child: const Text(
                      'Adjust settings for better usability',
                      style: TextStyle(fontSize: 13, color: _mutedText),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: Column(
                      children: [
                        _SettingsRow(
                          icon: Icons.text_fields,
                          iconColor: _mutedText,
                          iconBackground: _lightBlue,
                          title: 'Text Size',
                          subtitle: 'Adjust font size',
                          semanticLabel:
                              'Text Size, adjust font size for better readability',
                          semanticHint:
                              'Double tap to change text size settings',
                          onTap: () => _handleTextSize(context),
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: _cardBorder),
                        const SizedBox(height: 12),
                        _SettingsRow(
                          icon: Icons.contrast_outlined,
                          iconColor: _mutedText,
                          iconBackground: _lightBlue,
                          title: 'High Contrast',
                          subtitle: 'Improve visibility',
                          semanticLabel:
                              'High Contrast, improve visibility with enhanced contrast',
                          semanticHint:
                              'Double tap to enable high contrast mode',
                          onTap: () => _handleHighContrast(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ProfileCard(
                    child: _SettingsRow(
                      icon: Icons.shield_outlined,
                      iconColor: _mutedText,
                      iconBackground: _lightBlue,
                      title: 'Privacy & Security',
                      semanticLabel:
                          'Privacy and Security, manage your data and security settings',
                      semanticHint:
                          'Double tap to access privacy and security options',
                      onTap: () => _handlePrivacySecurity(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: _SettingsRow(
                      icon: Icons.help_outline,
                      iconColor: _mutedText,
                      iconBackground: _lightBlue,
                      title: 'Help & Support',
                      semanticLabel:
                          'Help and Support, access user guides and contact support',
                      semanticHint:
                          'Double tap to access help and support resources',
                      onTap: () => _handleHelpSupport(context),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Semantics(
                      label: 'Sign Out',
                      hint: 'Double tap to logout from your account',
                      button: true,
                      child: TextButton.icon(
                        onPressed: () => _handleSignOut(context),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFDA3B4A),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        icon: ExcludeSemantics(child: const Icon(Icons.logout)),
                        label: ExcludeSemantics(
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomBar(
        onTap: (index) => _onNavTap(context, index),
        onNowTap: () => _handleViewAppointment(context),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: _mutedText),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 14, color: _mutedText)),
      ],
    );
  }
}

class _PreferenceToggle extends StatelessWidget {
  const _PreferenceToggle({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onChanged,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final bool value;
  final String semanticLabel;
  final String semanticHint;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      toggled: value,
      child: Row(
        children: [
          ExcludeSemantics(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ExcludeSemantics(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: _mutedText),
                  ),
                ],
              ),
            ),
          ),
          ExcludeSemantics(
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    this.subtitle,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String? subtitle;
  final String semanticLabel;
  final String semanticHint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            ExcludeSemantics(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ExcludeSemantics(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(fontSize: 12, color: _mutedText),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            ExcludeSemantics(
              child: const Icon(
                Icons.chevron_right,
                color: _mutedText,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onTap, required this.onNowTap});

  final ValueChanged<int> onTap;
  final VoidCallback onNowTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: 'Current appointment: Physical Therapy at 2:00 PM at clinic',
          hint: 'Double tap to view full appointment details',
          button: true,
          liveRegion: true,
          child: InkWell(
            onTap: onNowTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: _headerColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  ExcludeSemantics(
                    child: const Icon(
                      Icons.schedule,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ExcludeSemantics(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Now: Physical Therapy Appointment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: const [
                              Icon(
                                Icons.schedule,
                                size: 12,
                                color: Colors.white70,
                              ),
                              Text(
                                '02:00 PM',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                '•',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              Icon(
                                Icons.local_hospital_outlined,
                                size: 12,
                                color: Colors.white70,
                              ),
                              Text(
                                'At clinic',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Row(
                      children: const [
                        Text('View', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: 4,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: _mutedText,
              backgroundColor: Colors.white,
              elevation: 0,
              onTap: onTap,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, semanticLabel: 'Nav Home'),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline, semanticLabel: 'Nav Tasks'),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined, semanticLabel: 'Nav Calendar'),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline, semanticLabel: 'Nav Messages'),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, semanticLabel: 'Nav Profile'),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



