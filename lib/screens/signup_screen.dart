import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo_badge.dart';
import '../widgets/primary_button.dart';

const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _roleIconBackground = Color(0xFFE9F1FB);
const _roleSelectedBackground = Color(0xFFF2F6FF);

enum _CareRole { caregiver, recipient }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  _CareRole _selectedRole = _CareRole.caregiver;

  void _onContinue() {
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: AppLogoBadge.circle(size: 64)),
                    const SizedBox(height: 16),
                    const Text(
                      'Choose Your Role',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Help us personalize your\nCareConnect experience',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: _mutedText,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _RoleCard(
                      selected: _selectedRole == _CareRole.caregiver,
                      icon: Icons.people_alt_outlined,
                      title: "I'm a Caregiver",
                      subtitle: 'Caring for a loved one or patient',
                      bullets: const [
                        'Coordinate care and tasks',
                        'Track health information',
                        'Manage appointments and medications',
                        'Stay connected with care recipients',
                      ],
                      onTap: () {
                        setState(() {
                          _selectedRole = _CareRole.caregiver;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _RoleCard(
                      selected: _selectedRole == _CareRole.recipient,
                      icon: Icons.favorite_border,
                      title: "I'm a Care Recipient",
                      subtitle: 'Receiving care and support',
                      bullets: const [
                        'View your care plan and tasks',
                        'Log health information and symptoms',
                        'Access appointment schedules',
                        'Communicate with your caregivers',
                      ],
                      onTap: () {
                        setState(() {
                          _selectedRole = _CareRole.recipient;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: 'Continue',
                      onPressed: _onContinue,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'You can change this setting later in your profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: _mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.bullets,
    required this.onTap,
  });

  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> bullets;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = selected ? AppColors.primary : _cardBorder;
    final Color backgroundColor =
        selected ? _roleSelectedBackground : Colors.white;
    final Color iconBackground = selected
        ? AppColors.primary.withOpacity(0.12)
        : _roleIconBackground;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: selected ? 1.4 : 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primary, size: 28),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: _mutedText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              for (int i = 0; i < bullets.length; i++) ...[
                _RoleBullet(text: bullets[i]),
                if (i < bullets.length - 1) const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleBullet extends StatelessWidget {
  const _RoleBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check,
          color: AppColors.primary,
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
