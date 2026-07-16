import 'package:flutter/material.dart';
import '../../data/utils/auth_utility.dart';
import '../widgets/background_widget.dart';
import '../widgets/task_manager_logo.dart';
import 'login_screen.dart';
import 'main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Load local user details from shared preferences
    await AuthUtility.getUserInfo();

    // Wait for 2 seconds for the splash effect
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      if (AuthUtility.checkIfUserLoggedIn) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainBottomNavScreen()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundWidget(
      child: Center(
        child: TaskManagerLogo(
          iconSize: 72,
          fontSize: 36,
        ),
      ),
    );
  }
}
