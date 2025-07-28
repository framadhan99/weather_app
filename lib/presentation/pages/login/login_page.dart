import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/ui_helper.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/presentation/pages/home/home_page.dart';
import 'package:weather_app/presentation/widgets/icon/icon_widget.dart';

import '../../widgets/button/button_general.dart';
import '../../widgets/inputs/texform_general.dart';

/// LoginPage displays a login form where users can input their credentials.
/// It includes two input fields: one for username/email and one for password,
/// along with a login button that navigates to the HomePage upon tapping.

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scrollable body to prevent overflow on small screens or keyboard pop-up
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login container with white background and rounded corners
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(150),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    IconWidget(),
                    verticalSpace(
                      screenHeightPercentage(context, percentage: 10),
                    ),
                    // Username/email input
                    TextFromGeneral(
                      focusBorderColor: AssetColors.colorPrimary,
                      label: "Usernmae/Email",
                      hintText: "Enter your username or email",
                    ),
                    verticalSpace(24),
                    // Password input
                    TextFromGeneral(
                      obscureText: true,
                      maxLines: 1,
                      focusBorderColor: AssetColors.colorPrimary,
                      label: "Password",
                      hintText: "Enter your username or password",
                    ),
                    verticalSpace(32),
                    // Login button that navigates to the home page
                    ButtonGeneral(
                      label: "Login",
                      onTap: () => nextScreen(HomePage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
