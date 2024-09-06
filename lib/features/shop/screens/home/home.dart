import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/primary_header_container.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/search_container.dart';
import 'package:rental_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:rental_app/common/widgets/text/app_section_heading.dart';
import 'package:rental_app/features/shop/screens/all_listings/all_listings.dart';
import 'package:rental_app/features/shop/screens/home/widgets/app_home_categories.dart';
import 'package:rental_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:rental_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:rental_app/utils/constants/image_strings.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const AppPrimaryHeaderContainer(
              height: 400,
              child: Column(
                children: [
                  AppHomeAppBar(),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  AppSearchContainer(
                    text: 'Search properties',
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(children: [
                      AppSectionHeading(
                        title: 'Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      AppHomeCategories()
                    ]),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                const AppPromoSlider(
                  banners: [
                    AppImages.promoBanner1,
                    AppImages.promoBanner2,
                    AppImages.promoBanner3
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                AppSectionHeading(
                  title: "Popular Listings",
                  smallSize: true,
                  onPressed: () => Get.to(() => const AllListings()),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
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
          )
        ]),
      ),
    );
  }
}
