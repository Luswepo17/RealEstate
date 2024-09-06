import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class AllListings extends StatelessWidget {
  const AllListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: Text(
          "Popular Listings",
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                items: ['Name', 'Newest', 'Higher Price', 'Lower Price']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
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
                itemCount: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
