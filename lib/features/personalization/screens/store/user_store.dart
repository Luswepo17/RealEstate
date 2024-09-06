import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:rental_app/common/widgets/text/app_section_heading.dart';
import 'package:rental_app/features/personalization/screens/create-listing/create_listing.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class UserStore extends StatelessWidget {
  const UserStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        showBackArrow: true,
        title: Text("Shop name"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: AppSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Seller name"), Text("Shop Location")],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit))
              ],
            ),
            const Divider(),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            AppSectionHeading(
              title: "Listings",
              smallSize: true,
              showActionButton: true,
              buttonTitle: "Add",
              onPressed: () => Get.to(() => const CreateListing()),
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
            ),
          ],
        ),
      ),
    );
  }
}
