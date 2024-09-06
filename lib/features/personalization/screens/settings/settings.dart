import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/primary_header_container.dart';
import 'package:rental_app/features/authentication/screens/login/login.dart';
import 'package:rental_app/features/personalization/screens/settings/widgets/app_menu_settings_tile.dart';
import 'package:rental_app/features/personalization/screens/settings/widgets/app_profile_tile.dart';
import 'package:rental_app/features/personalization/screens/store/user_store.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void logout() {
    // Clear any persistent data or states

    // Use GetX to navigate back to the login screen and clear history
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
                height: 220,
                child: Column(
                  children: [
                    AppAppBar(
                      title: Text(
                        "Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                    const AppProfileTile(
                      firstname: "firstname",
                      lastname: "lastname",
                      email: "email",
                      phoneNumber: "phoneNumber",
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(
                AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Settings",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.shop,
                    title: 'Manage Store',
                    subTitle: 'View and Manage your listings',
                    onTap: () => Get.to(() => const UserStore()),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.activity,
                    title: 'Transaction History',
                    subTitle: 'View Past purchases',
                    onTap: () => {},
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => logout(),
                        child: const Text("Logout!")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
