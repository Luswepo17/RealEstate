import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/features/personalization/screens/create-listing/widgets/add_image_form.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class Createlistingform extends StatelessWidget {
  const Createlistingform({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.abc), labelText: "Name"),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.payments_rounded), labelText: "Price"),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.location), labelText: "Location"),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            minLines: 5, // Minimum number of visible lines
            maxLines: null, // Allows the field to expand further if needed
            keyboardType: TextInputType.multiline, // Allows multiline input
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description_outlined),
              labelText: "Description",
              alignLabelWithHint: true,
              border: OutlineInputBorder(), // Adds border to the textarea
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextButton(
              onPressed: () => Get.to(() => const AddImageForm()),
              child: const Text("Next"))
        ],
      ),
    ));
  }
}
