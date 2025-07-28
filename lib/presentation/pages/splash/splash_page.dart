import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/weather/provider/app/app_start_provider.dart';
import '../../widgets/icon/icon_widget.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';

/// SplashPage is the initial screen shown when the app starts.
/// It initializes the application by calling [AppStartProvider.initializeApp],
/// then navigates to either [HomePage] or [LoginPage] based on the login status.

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateFromSplash();
  }

  /// This function initializes the app and navigates to the appropriate page.
  /// If the user is already logged in, it navigates to [HomePage].
  /// Otherwise, it navigates to [LoginPage].
  Future<void> navigateFromSplash() async {
    final appStartProvider = Provider.of<AppStartProvider>(
      context,
      listen: false,
    );
    await appStartProvider.initializeApp();

    if (!mounted) return;

    if (appStartProvider.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Display a centered logo or app icon during loading
    return Scaffold(body: Center(child: IconWidget()));
  }
}
