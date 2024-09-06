import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/icons/app_circular_icon.dart';
import 'package:rental_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:rental_app/navigation_menu.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          "Favourites",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          AppCircularIcon(
              icon: Iconsax.add,
              onPressed: () => {
                    controller.selectedINdex.value = 0,
                    Get.to(() => const NavigationMenu()),
                  })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSizes.gridViewSpacing,
                  crossAxisSpacing: AppSizes.gridViewSpacing,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => const AppProductCardVertical(),
                itemCount: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
