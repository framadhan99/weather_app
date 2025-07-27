import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/home/home_page.dart';
import 'package:weather_app/presentation/pages/login/login_page.dart';

import '../../../data/weather/provider/app/app_start_provider.dart';

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
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(60),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withAlpha(80),
                  width: 0.5,
                ),
              ),
              child: SvgPicture.asset(
                AssetPaths.iconCloudy,
                width: 150,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "Weather App",
                style: AssetStyles.heading.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
