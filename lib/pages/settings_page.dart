import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/policy_dialogs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;

  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/ataturkcu/aether');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open GitHub')),
        );
      }
    }
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF60A5FA).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.apps_rounded,
                      size: 56,
                      color: Color(0xFF60A5FA),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Aether',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF60A5FA).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF60A5FA),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'Made by',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ata Türkçü',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'with',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '❤️',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'in Istanbul',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Close',
              style: TextStyle(
                color: Color(0xFF60A5FA),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        physics: const BouncingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            const SizedBox(height: 8),
            
            // General Section
            _buildSectionTitle('General'),
            const SizedBox(height: 8),
            
            _buildSettingCard(
              icon: Icons.notifications_rounded,
              title: 'Notifications',
              subtitle: 'Receive app notifications',
              trailing: Switch(
                value: _notifications,
                activeColor: const Color(0xFF60A5FA),
                onChanged: (value) {
                  setState(() {
                    _notifications = value;
                  });
                },
              ),
            ),
            
            const SizedBox(height: 12),
            
            _buildSettingCard(
              icon: Icons.language_rounded,
              title: 'Language',
              subtitle: 'English',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                // Language selection
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSettingCard(
              icon: Icons.security_rounded,
              title: 'Permissions',
              subtitle: 'Manage app permissions',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                // Permissions
              },
            ),
            
            const SizedBox(height: 24),
            
            // Updates Section
            _buildSectionTitle('Updates'),
            const SizedBox(height: 8),
            
            _buildSettingCard(
              icon: Icons.download_rounded,
              title: 'Check for Updates',
              subtitle: 'Manually check updates',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                // Check updates
              },
            ),
            
            const SizedBox(height: 24),
            
            // About Section
            _buildSectionTitle('About'),
            const SizedBox(height: 8),
            
            _buildSettingCard(
              icon: Icons.description_rounded,
              title: 'Terms of Use',
              subtitle: 'View terms and disclaimer',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                PolicyDialogs.showTermsOfUse(context);
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSettingCard(
              icon: Icons.privacy_tip_rounded,
              title: 'Privacy Policy',
              subtitle: 'I respect your privacy',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                PolicyDialogs.showPrivacyPolicy(context);
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSettingCard(
              icon: Icons.info_rounded,
              title: 'App Version',
              subtitle: '1.0.0',
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                _showAboutDialog(context);
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSettingCard(
              icon: Icons.code_rounded,
              title: 'GitHub Repository',
              subtitle: 'Star on GitHub to support me!',
              trailing: Icon(
                Icons.open_in_new_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              onTap: _launchGitHub,
            ),
            
            const SizedBox(height: 100), // Bottom padding for floating nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8, top: 4),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFF60A5FA),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    Widget? child,
    VoidCallback? onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF60A5FA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: const Color(0xFF60A5FA),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (trailing != null) trailing,
                  ],
                ),
                if (child != null) child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
