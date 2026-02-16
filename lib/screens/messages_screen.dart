import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _lightBlue = Color(0xFFEFF5FF);
const _emergencyRed = Color(0xFFDA3B4A);
const _emergencyBg = Color(0xFFFFE9EC);

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  void _handleEmergencySOS(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Emergency SOS - This will immediately contact your emergency contacts and care team',
        ),
      ),
    );
  }

  void _handleQuickContact(BuildContext context, String contactName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening conversation with $contactName')),
    );
  }

  void _handleSendMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Send Message - Feature coming soon to send your message',
        ),
      ),
    );
  }

  void _handleQuickReply(BuildContext context, String reply) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Quick reply sent: $reply')));
  }

  void _handleMessageOpen(BuildContext context, String senderName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening conversation with $senderName')),
    );
  }

  void _handleAcknowledge(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment reminder acknowledged')),
    );
  }

  void _handleSnooze(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder snoozed for 10 minutes')),
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
        return;
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
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
                  Semantics(
                    label: 'Back',
                    hint: 'Navigate back to previous screen',
                    button: true,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Semantics(
                      header: true,
                      child: const Text(
                        'Messages',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(
                    label: 'Emergency SOS',
                    hint:
                        'Double tap to immediately contact your emergency contacts and care team',
                    button: true,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _emergencyBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _emergencyRed.withOpacity(0.3),
                        ),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () => _handleEmergencySOS(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _emergencyRed,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        icon: ExcludeSemantics(
                          child: const Icon(Icons.warning_outlined),
                        ),
                        label: ExcludeSemantics(
                          child: const Text(
                            'Emergency SOS',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    header: true,
                    child: Text(
                      'Quick Contact',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    label: 'Quick contacts list',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _QuickContactAvatar(
                          initials: 'SJ',
                          name: 'Sarah',
                          subtitle: 'Primary Care',
                          semanticLabel: 'Contact Sarah, Primary Care provider',
                          semanticHint:
                              'Double tap to open conversation with Sarah',
                          onTap: () => _handleQuickContact(context, 'Sarah'),
                        ),
                        const SizedBox(width: 16),
                        _QuickContactAvatar(
                          initials: 'DM',
                          name: 'Dr.',
                          subtitle: 'Doctor',
                          semanticLabel: 'Contact Doctor',
                          semanticHint:
                              'Double tap to open conversation with your doctor',
                          onTap: () => _handleQuickContact(context, 'Doctor'),
                        ),
                        const SizedBox(width: 16),
                        _QuickContactAvatar(
                          initials: 'NC',
                          name: 'Nurse',
                          subtitle: 'Home Care',
                          semanticLabel: 'Contact Nurse, Home Care provider',
                          semanticHint:
                              'Double tap to open conversation with your nurse',
                          onTap: () => _handleQuickContact(context, 'Nurse'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    label: 'Message input',
                    hint: 'Type your message here and tap send button to send',
                    textField: true,
                    child: Container(
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
                      child: Row(
                        children: [
                          Expanded(
                            child: ExcludeSemantics(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type your message...',
                                  hintStyle: const TextStyle(
                                    color: _mutedText,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onTap: () => _handleSendMessage(context),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Semantics(
                            label: 'Send message',
                            hint: 'Double tap to send your typed message',
                            button: true,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () => _handleSendMessage(context),
                                icon: ExcludeSemantics(
                                  child: const Icon(
                                    Icons.send,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Semantics(
                    label: 'Quick reply options',
                    child: Row(
                      children: [
                        _QuickReplyChip(
                          label: 'Yes',
                          semanticLabel: 'Quick reply: Yes',
                          semanticHint:
                              'Double tap to send Yes as a quick reply',
                          onTap: () => _handleQuickReply(context, 'Yes'),
                        ),
                        const SizedBox(width: 8),
                        _QuickReplyChip(
                          label: 'On my way',
                          semanticLabel: 'Quick reply: On my way',
                          semanticHint:
                              'Double tap to send On my way as a quick reply',
                          onTap: () => _handleQuickReply(context, 'On my way'),
                        ),
                        const SizedBox(width: 8),
                        _QuickReplyChip(
                          label: 'Call me',
                          semanticLabel: 'Quick reply: Call me',
                          semanticHint:
                              'Double tap to send Call me as a quick reply',
                          onTap: () => _handleQuickReply(context, 'Call me'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    header: true,
                    child: Text(
                      'Recent Messages',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _MessageCard(
                    initials: 'RM',
                    name: 'Robert Martinez',
                    message: 'Morning walk completed! Felt great today.',
                    time: '1 hour ago',
                    isUnread: false,
                    semanticLabel:
                        'Message from Robert Martinez, 1 hour ago. Morning walk completed! Felt great today.',
                    semanticHint:
                        'Double tap to open conversation with Robert Martinez',
                    onTap: () => _handleMessageOpen(context, 'Robert Martinez'),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    label:
                        'Appointment reminder from CareConnect, 2 hours ago. Physical therapy appointment at 2:00 PM',
                    hint: 'Contains acknowledge and snooze buttons',
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E6),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFFE8B3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ExcludeSemantics(
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: _lightBlue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.notifications_outlined,
                                    color: AppColors.primary,
                                    size: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ExcludeSemantics(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'CareConnect',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '2 hours ago',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: _mutedText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ExcludeSemantics(
                            child: const Text(
                              'Reminder: Physical therapy appointment at 2:00 PM',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Semantics(
                                  label: 'Acknowledge',
                                  hint:
                                      'Double tap to acknowledge this appointment reminder',
                                  button: true,
                                  child: OutlinedButton(
                                    onPressed: () =>
                                        _handleAcknowledge(context),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: AppColors.primary,
                                      side: const BorderSide(
                                        color: AppColors.primary,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: ExcludeSemantics(
                                      child: const Text('Acknowledge'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Semantics(
                                  label: 'Snooze 10 minutes',
                                  hint:
                                      'Double tap to snooze this reminder for 10 minutes',
                                  button: true,
                                  child: OutlinedButton(
                                    onPressed: () => _handleSnooze(context),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: _mutedText,
                                      side: const BorderSide(
                                        color: _cardBorder,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: ExcludeSemantics(
                                      child: const Text('Snooze 10 min'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _MessageCard(
                    initials: 'RM',
                    name: 'Robert Martinez',
                    message: 'Can you pick up my prescription this afternoon?',
                    time: '1 day ago',
                    isUnread: true,
                    semanticLabel:
                        'Unread message from Robert Martinez, 1 day ago. Can you pick up my prescription this afternoon?',
                    semanticHint:
                        'Double tap to open conversation and respond to Robert Martinez',
                    onTap: () => _handleMessageOpen(context, 'Robert Martinez'),
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

class _QuickContactAvatar extends StatelessWidget {
  const _QuickContactAvatar({
    required this.initials,
    required this.name,
    required this.subtitle,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final String initials;
  final String name;
  final String subtitle;
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
        child: Column(
          children: [
            ExcludeSemantics(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ExcludeSemantics(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 2),
            ExcludeSemantics(
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: _mutedText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickReplyChip extends StatelessWidget {
  const _QuickReplyChip({
    required this.label,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final String label;
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
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _cardBorder),
          ),
          child: ExcludeSemantics(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({
    required this.initials,
    required this.name,
    required this.message,
    required this.time,
    required this.isUnread,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final String initials;
  final String name;
  final String message;
  final String time;
  final bool isUnread;
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
        borderRadius: BorderRadius.circular(16),
        child: Container(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExcludeSemantics(
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _lightBlue,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ExcludeSemantics(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 12,
                              color: _mutedText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: _mutedText,
                          height: 1.3,
                        ),
                      ),
                      if (isUnread) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Unread',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
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
              currentIndex: 3,
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
