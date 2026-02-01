import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _lightBlue = Color(0xFFEFF5FF);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showNotImplemented(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Not implemented in Week 4')));
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
                  const Expanded(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showNotImplemented(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                  _ProfileCard(
                    child: Row(
                      children: [
                        Container(
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
                        const SizedBox(width: 16),
                        Expanded(
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
                        TextButton(
                          onPressed: () => _showNotImplemented(context),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: Column(
                      children: [
                        _ContactRow(
                          icon: Icons.email_outlined,
                          text: 'sarah.johnson@email.com',
                          onTap: () => _showNotImplemented(context),
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: _cardBorder),
                        const SizedBox(height: 12),
                        _ContactRow(
                          icon: Icons.phone_outlined,
                          text: '(555) 123-4567',
                          onTap: () => _showNotImplemented(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Manage your notification settings',
                    style: TextStyle(fontSize: 13, color: _mutedText),
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
                          onChanged: (value) => _showNotImplemented(context),
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
                          onChanged: (value) => _showNotImplemented(context),
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
                          onChanged: (value) => _showNotImplemented(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Customize your CareConnect experience',
                    style: TextStyle(fontSize: 13, color: _mutedText),
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
                      onChanged: (value) => _showNotImplemented(context),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Accessibility',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Adjust settings for better usability',
                    style: TextStyle(fontSize: 13, color: _mutedText),
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
                          onTap: () => _showNotImplemented(context),
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
                          onTap: () => _showNotImplemented(context),
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
                      onTap: () => _showNotImplemented(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileCard(
                    child: _SettingsRow(
                      icon: Icons.help_outline,
                      iconColor: _mutedText,
                      iconBackground: _lightBlue,
                      title: 'Help & Support',
                      onTap: () => _showNotImplemented(context),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: TextButton.icon(
                      onPressed: () => _showNotImplemented(context),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFDA3B4A),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
        onNowTap: () => _showNotImplemented(context),
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
    required this.onChanged,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
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
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ],
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
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
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
          const Icon(Icons.chevron_right, color: _mutedText, size: 20),
        ],
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: _headerColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Expanded(
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
                        Icon(Icons.schedule, size: 12, color: Colors.white70),
                        Text(
                          '02:00 PM',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        Text(
                          '•',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        Icon(
                          Icons.local_hospital_outlined,
                          size: 12,
                          color: Colors.white70,
                        ),
                        Text(
                          'At clinic',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onNowTap,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Row(
                  children: const [
                    Text('View'),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 14),
                  ],
                ),
              ),
            ],
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
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
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
