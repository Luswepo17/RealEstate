import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/styles/shadows.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/app_rounded_container.dart';
import 'package:rental_app/common/widgets/icons/app_circular_icon.dart';
import 'package:rental_app/common/widgets/images/app_rounded_image.dart';
import 'package:rental_app/features/shop/screens/product-detail/product_detail.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/image_strings.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [AppShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: dark ? AppColors.darkGrey : AppColors.white),
        child: Column(children: [
          AppRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child: const Stack(
              children: [
                AppRoundedImage(
                  height: double.infinity,
                  imageUrl: AppImages.promoBanner1,
                  applyImageRadius: true,
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: AppCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems / 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.sm),
            child: Column(
              children: [
                Text(
                  "3 Bedroomed House",
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),
                const Row(
                  children: [
                    Text(
                      "Seller name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: AppSizes.xs,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: AppColors.primary,
                      size: AppSizes.iconXs,
                    )
                  ],
                ),
                //Spacer(),
                Row(
                  children: [
                    Text(
                      "Lusaka",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "K4000",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
