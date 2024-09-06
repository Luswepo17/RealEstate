import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/features/authentication/screens/wishlist/wishlist.dart';
import 'package:rental_app/features/personalization/screens/settings/settings.dart';
import 'package:rental_app/features/shop/screens/home/home.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            backgroundColor: darkMode ? AppColors.black : Colors.white,
            indicatorColor: darkMode
                ? AppColors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            selectedIndex: controller.selectedINdex.value,
            onDestinationSelected: (index) =>
                controller.selectedINdex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              // NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Favourites'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedINdex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedINdex = 0.obs;

  final screens = [
    const HomeScreen(),
    // const StoreScreen(),
    const FavouritesScreen(),
    const SettingsScreen()
  ];
}
