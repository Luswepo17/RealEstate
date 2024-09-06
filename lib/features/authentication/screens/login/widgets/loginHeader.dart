import 'package:flutter/material.dart';
import 'package:rental_app/utils/constants/image_strings.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/constants/text_strings.dart';

class AppLoginHeader extends StatelessWidget {
  const AppLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: AppSizes.defaultSpace,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              height: 150,
              image: AssetImage(AppImages.appLogo),
            ),
            Text(
              AppTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
            Text(
              AppTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
