import 'package:flutter/material.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/text/app_section_heading.dart';
import 'package:rental_app/features/personalization/screens/profile/app_profile_menu.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phoneNumber});

  final String firstname;
  final String lastname;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            const AppSectionHeading(
              title: "Profile Information",
              showActionButton: false,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            AppProfileMenu(
              onPressed: () {},
              title: 'Name',
              value: '$firstname $lastname',
            ),
            AppProfileMenu(
              onPressed: () {},
              title: 'Email',
              value: email,
            ),
            AppProfileMenu(
              onPressed: () {},
              title: 'Phone No',
              value: phoneNumber,
            ),
            const Divider(),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
