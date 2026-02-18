import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _softBlue = Color(0xFFEFF5FF);
const _softBlueBorder = Color(0xFFD7E6FF);
const _chipBlue = Color(0xFFE6F0FF);
const _chipBlueText = Color(0xFF2F5DA8);
const _chipGreen = Color(0xFFE8F7EE);
const _chipGreenText = Color(0xFF1E7A46);
const _careTeamBlue = Color(0xFF123E6B);
const _onHeaderSecondary = Color(0xFFDDE9FB);

Widget _orderedSection(double order, Widget child) {
  return FocusTraversalOrder(order: NumericFocusOrder(order), child: child);
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _showNotImplemented(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Not implemented in Week 4')));
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
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
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        return;
      case 5:
        Navigator.pushReplacementNamed(context, AppRoutes.healthLogs);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: Column(
          children: [
            const _DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Health Today',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Here's your care summary for today",
                      style: TextStyle(color: _mutedText),
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      color: _softBlue,
                      border: Border.all(color: _softBlueBorder),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.sentiment_satisfied_alt_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'How are you feeling today?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Take a moment to log your mood and symptoms',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: _mutedText,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _orderedSection(
                                  1,
                                  ElevatedButton(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      AppRoutes.healthLogs,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(48, 48),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text('Log Wellness Check'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(
                            icon: Icons.check_circle_outline,
                            iconColor: _chipGreenText,
                            iconBackground: _chipGreen,
                            value: '1',
                            label: 'Completed',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.access_time,
                            iconColor: _chipBlueText,
                            iconBackground: _chipBlue,
                            value: '2',
                            label: 'Pending',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.calendar_today_outlined,
                            iconColor: AppColors.primary,
                            iconBackground: Color(0xFFEAF1FF),
                            value: '3',
                            label: 'Appointments',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Next Appointment',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              _TagChip(
                                label: 'therapy',
                                background: _chipBlue,
                                foreground: _chipBlueText,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Physical Therapy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Knee rehabilitation session',
                            style: TextStyle(color: _mutedText),
                          ),
                          const SizedBox(height: 12),
                          _InfoRow(
                            icon: Icons.calendar_today_outlined,
                            label: 'Monday, Jan 26 at 02:00 PM',
                          ),
                          const SizedBox(height: 6),
                          _InfoRow(
                            icon: Icons.person_outline,
                            label: 'Dr. Lisa Chen, PT',
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: _orderedSection(
                              2,
                              OutlinedButton.icon(
                                onPressed: () => _showNotImplemented(context),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  minimumSize: const Size(48, 48),
                                  side: const BorderSide(color: _cardBorder),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                icon: const Icon(Icons.notifications_none),
                                label: const Text('Set Reminder'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Today's Tasks",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              _orderedSection(
                                3,
                                TextButton(
                                  onPressed: () => _showNotImplemented(context),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primary,
                                    minimumSize: const Size(48, 48),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: Row(
                                    children: const [
                                      Text('View All'),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const _TaskItem(
                            title: 'Blood Pressure Check',
                            time: '09:00 AM',
                            levelLabel: 'medium',
                            levelBackground: _chipBlue,
                            levelForeground: _chipBlueText,
                          ),
                          const SizedBox(height: 12),
                          const Divider(height: 1, color: _cardBorder),
                          const SizedBox(height: 12),
                          const _TaskItem(
                            title: 'Prepare Lunch',
                            time: '12:00 PM',
                            levelLabel: 'medium',
                            levelBackground: _chipBlue,
                            levelForeground: _chipBlueText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Recent Wellness Check',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              _orderedSection(
                                4,
                                TextButton(
                                  onPressed: () => _showNotImplemented(context),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primary,
                                    minimumSize: const Size(48, 48),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: Row(
                                    children: const [
                                      Text('View All'),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const _WellnessItem(
                            title: 'Mood Check',
                            subtitle: 'Feeling good today',
                            time: 'Jan 26, 1:59 PM',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      color: _careTeamBlue,
                      border: Border.all(color: _careTeamBlue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your care team is here for you',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Need help or have questions? Reach out anytime.',
                            style: TextStyle(
                              color: _onHeaderSecondary,
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _orderedSection(
                            5,
                            ElevatedButton(
                              onPressed: () => _showNotImplemented(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primary,
                                minimumSize: const Size(48, 48),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Send Message'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DashboardCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Health Summary',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Recent vitals and measurements',
                            style: TextStyle(fontSize: 12, color: _mutedText),
                          ),
                          const SizedBox(height: 12),
                          const _SummaryItem(
                            icon: Icons.monitor_heart_outlined,
                            title: 'Blood Pressure',
                            subtitle: '1 hour ago',
                            value: '120/80',
                            iconBackground: Color(0xFFE6F4FF),
                            iconColor: AppColors.primary,
                          ),
                          const SizedBox(height: 12),
                          const Divider(height: 1, color: _cardBorder),
                          const SizedBox(height: 12),
                          const _SummaryItem(
                            icon: Icons.favorite_border,
                            title: 'Heart Rate',
                            subtitle: '1 hour ago',
                            value: '72 bpm',
                            iconBackground: Color(0xFFFFE9EC),
                            iconColor: Color(0xFFDA3B4A),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: _orderedSection(
                              6,
                              OutlinedButton(
                                onPressed: () => _showNotImplemented(context),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  minimumSize: const Size(48, 48),
                                  side: const BorderSide(color: _cardBorder),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('View Full History'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _orderedSection(
          7,
          _DashboardBottomBar(
            onTap: (index) => _onNavTap(context, index),
            onNowTap: () => _showNotImplemented(context),
          ),
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _headerColor,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monday, January 26, 2026',
              style: TextStyle(
                color: _onHeaderSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '4:02 PM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(Icons.person_outline, color: _onHeaderSecondary),
                const SizedBox(width: 6),
                const Text(
                  'Robert',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Patient',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.home_outlined,
                  color: _onHeaderSecondary,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Home Dashboard',
                  style: TextStyle(
                    color: _onHeaderSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({
    required this.child,
    this.color = Colors.white,
    this.border,
  });

  final Widget child;
  final Color color;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: border ?? Border.all(color: _cardBorder),
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

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: _mutedText)),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: _mutedText),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: _mutedText, fontSize: 13)),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({
    required this.title,
    required this.time,
    required this.levelLabel,
    required this.levelBackground,
    required this.levelForeground,
  });

  final String title;
  final String time;
  final String levelLabel;
  final Color levelBackground;
  final Color levelForeground;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.radio_button_unchecked, size: 20, color: _mutedText),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: _mutedText),
              ),
            ],
          ),
        ),
        _TagChip(
          label: levelLabel,
          background: levelBackground,
          foreground: levelForeground,
        ),
      ],
    );
  }
}

class _WellnessItem extends StatelessWidget {
  const _WellnessItem({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _chipBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.sentiment_satisfied_alt_outlined,
            color: AppColors.primary,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: _mutedText),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: _mutedText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.iconBackground,
    required this.iconColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final Color iconBackground;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: _mutedText),
              ),
            ],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _DashboardBottomBar extends StatelessWidget {
  const _DashboardBottomBar({required this.onTap, required this.onNowTap});

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
              const Icon(Icons.schedule, color: _onHeaderSecondary, size: 18),
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
                        Icon(
                          Icons.schedule,
                          size: 12,
                          color: _onHeaderSecondary,
                        ),
                        Text(
                          '02:00 PM',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '•',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
                        ),
                        Icon(
                          Icons.local_hospital_outlined,
                          size: 12,
                          color: _onHeaderSecondary,
                        ),
                        Text(
                          'At clinic',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
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
                  minimumSize: const Size(48, 48),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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
              currentIndex: 0,
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



