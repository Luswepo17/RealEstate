import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/features/authentication/screens/signup/verify_email.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/constants/text_strings.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class AppSignUpForm extends StatelessWidget {
  const AppSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: AppTexts.firstname,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwInputFields,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: AppTexts.firstname,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputFields,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputFields,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: AppTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '${AppTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '${AppTexts.privacyPolicy} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AppColors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? AppColors.white : AppColors.primary)),
                TextSpan(
                    text: '${AppTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '${AppTexts.termsOfUse} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AppColors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? AppColors.white : AppColors.primary)),
              ]),
            )
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(AppTexts.createAccount),
          ),
        )
      ],
    ));
  }
}
