import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/app_circular_container.dart';
import 'package:rental_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:rental_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:rental_app/common/widgets/text/product_title_text.dart';
import 'package:rental_app/navigation_menu.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    final controller = Get.put(NavigationController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          controller.selectedINdex.value = 0,
          Get.to(() => const NavigationMenu())
        },
        child: const Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCurvedEdgeWidget(
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: AppCircularContainer(
                          backgroondColour:
                              AppColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: AppCircularContainer(
                          backgroondColour:
                              AppColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  SizedBox(
                                    width: AppSizes.spaceBtwItems,
                                  ),
                                  CircleAvatar(),
                                  SizedBox(
                                    width: AppSizes.spaceBtwItems,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Seller name"),
                                      Text("Shop Location"),
                                      Text("Number: 097825739"),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                        color: dark
                                            ? AppColors.white
                                            : AppColors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.phone,
                                        color: dark
                                            ? AppColors.white
                                            : AppColors.black,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: AppSizes.defaultSpace),
              child: AppProductTitleText(title: "Listings"),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: GridView.builder(
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
            )
          ],
        ),
      ),
    );
  }
}
