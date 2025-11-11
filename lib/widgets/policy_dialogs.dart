import 'package:flutter/material.dart';

class PolicyDialogs {
  static void showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "I don't want your information, images, videos, or anything else that stays on your phone.\n\n"
            "So I don't collect any information at all.\n\n"
            "This is a fully offline application and it's open source, "
            "so you can go and inspect it by yourself.\n\n"
            "Your privacy matters. ❤️",
            style: TextStyle(height: 1.5),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(color: Color(0xFF60A5FA)),
            ),
          ),
        ],
      ),
    );
  }

  static void showTermsOfUse(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Terms of Use & Disclaimer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "USE AT YOUR OWN RISK\n\n"
            "By using this application, you acknowledge and agree that:\n\n"
            "• Any actions you perform using this app are entirely at your own risk.\n\n"
            "• The developer is NOT responsible for any consequences, including but not limited to:\n"
            "  - Missed alarms or appointments\n"
            "  - Delayed notifications\n"
            "  - Job termination or professional issues\n"
            "  - Device malfunctions or data loss\n"
            "  - Any other direct or indirect damages\n\n"
            "• This application is provided 'as is' without any warranties.\n\n"
            "• You are solely responsible for how you use this app and its features.\n\n"
            "Use wisely!",
            style: TextStyle(height: 1.5),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'I Understand',
              style: TextStyle(color: Color(0xFF60A5FA)),
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> showWelcomeDialogs(BuildContext context) async {
    // Show Terms of Use first
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Welcome to Aether! 👋',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Before you start, please read our Terms of Use.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "USE AT YOUR OWN RISK\n\n"
                "By using this application, you acknowledge and agree that:\n\n"
                "• Any actions you perform using this app are entirely at your own risk.\n\n"
                "• The developer is NOT responsible for any consequences, including but not limited to:\n"
                "  - Missed alarms or appointments\n"
                "  - Delayed notifications\n"
                "  - Job termination or professional issues\n"
                "  - Device malfunctions or data loss\n"
                "  - Any other direct or indirect damages\n\n"
                "• This application is provided 'as is' without any warranties.\n\n"
                "• You are solely responsible for how you use this app and its features.",
                style: TextStyle(height: 1.5, fontSize: 13),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'I Understand & Accept',
              style: TextStyle(
                color: Color(0xFF60A5FA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    // Then show Privacy Policy
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Privacy Policy 🔒',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "I don't want your information, images, videos, or anything else that stays on your phone.\n\n"
            "So I don't collect any information at all.\n\n"
            "This is a fully offline application and it's open source, "
            "so you can go and inspect it by yourself.\n\n"
            "Your privacy matters. ❤️",
            style: TextStyle(height: 1.5, fontSize: 14),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Let's Go!",
              style: TextStyle(
                color: Color(0xFF60A5FA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    return true;
  }
}
