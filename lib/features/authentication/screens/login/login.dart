import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/common/styles/spacing_styles.dart';
import 'package:rental_app/common/widgets/signup_login/formdivider.dart';
import 'package:rental_app/common/widgets/signup_login/socialbuttons.dart';
import 'package:rental_app/features/authentication/screens/login/widgets/loginform.dart';
import 'package:rental_app/features/authentication/screens/login/widgets/loginheader.dart';

import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              const AppLoginHeader(),
              const AppLoginForm(),
              AppFormDivider(
                dividerText: AppTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const AppSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
