import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/features/personalization/screens/profile/profile.dart';
import 'package:rental_app/utils/constants/colors.dart';

class AppProfileTile extends StatelessWidget {
  const AppProfileTile({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phoneNumber,
  });

  final String firstname;
  final String lastname;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$firstname $lastname",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .apply(color: AppColors.white),
      ),
      subtitle: Text(
        email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => ProfileScreen(
                firstname: firstname,
                lastname: lastname,
                email: email,
                phoneNumber: phoneNumber,
              )),
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.white,
          )),
    );
  }
}
