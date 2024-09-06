import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/app_circular_container.dart';
import 'package:rental_app/common/widgets/images/app_rounded_image.dart';
import 'package:rental_app/features/shop/controllers/home_controller.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((url) =>
                    AppRoundedImage(applyImageRadius: true, imageUrl: url))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index))),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  AppCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroondColour: controller.carouselCurrentIndex.value == i
                        ? AppColors.primary
                        : AppColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
