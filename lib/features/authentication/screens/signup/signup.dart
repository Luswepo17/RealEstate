import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/common/widgets/signup_login/formdivider.dart';
import 'package:rental_app/common/widgets/signup_login/socialbuttons.dart';
import 'package:rental_app/features/authentication/screens/signup/widgets/app_sign_up_form.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppSignUpForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              AppFormDivider(dividerText: AppTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppSocialButtons(),
              const SizedBox(height: AppSizes.spaceBtwSections)
            ],
          ),
        ),
      ),
    );
  }
}
