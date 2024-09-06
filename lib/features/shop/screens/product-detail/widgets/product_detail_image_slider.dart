import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:rental_app/common/widgets/icons/app_circular_icon.dart';
import 'package:rental_app/common/widgets/images/app_rounded_image.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/image_strings.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(AppImages.promoBanner1))),
                )),
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AppRoundedImage(
                          width: 80,
                          backgroundColor:
                              dark ? AppColors.dark : AppColors.white,
                          imageUrl: AppImages.promoBanner2);
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                          width: AppSizes.spaceBtwItems,
                        ),
                    itemCount: 4),
              ),
            ),
            const AppAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
