import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../widgets/app_logo_badge.dart';
import '../widgets/feature_row.dart';
import '../widgets/primary_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FocusNode _initialFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _initialFocusNode.canRequestFocus) {
        _initialFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _initialFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F1F3D),
              Color(0xFF0B1630),
              Color(0xFF0A1228),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 520),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.12),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppLogoBadge.square(),
                                const SizedBox(height: 16),
                                Focus(
                                  focusNode: _initialFocusNode,
                                  child: FocusableActionDetector(
                                    focusNode: _initialFocusNode,
                                    child: Semantics(
                                      header: true,
                                      child: const Text(
                                        'CareConnect',
                                        style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Compassionate care coordination made simple',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                const FeatureRow(
                                  icon: Icons.people_alt_outlined,
                                  title: 'Stay Connected',
                                  description:
                                      'Coordinate care seamlessly between caregivers and loved ones',
                                ),
                                const SizedBox(height: 16),
                                const FeatureRow(
                                  icon: Icons.verified_user_outlined,
                                  title: 'Secure & Private',
                                  description:
                                      'Your health information is protected with industry-leading security',
                                ),
                                const SizedBox(height: 16),
                                const FeatureRow(
                                  icon: Icons.favorite_border,
                                  title: 'Personalized Care',
                                  description:
                                      'Track health, manage tasks, and maintain care plans all in one place',
                                ),
                                const SizedBox(height: 24),
                                PrimaryButton(
                                  label: 'Get Started',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.roleSelection,
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.login,
                                      );
                                    },
                                    child: const Text('Log in'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 12),
                        child: Text(
                          'By continuing, you agree to our Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
